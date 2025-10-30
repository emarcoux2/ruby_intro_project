service = PokemonTcgService.new

service.get_supertypes["data"].each do |supertype|
  Supertype.find_or_create_by!(name: supertype)
end

service.get_rarities["data"].each do |rarity|
  Rarity.find_or_create_by!(name: rarity)
  Rarity.find_or_create_by!(name: "N/A") # for cards that don't have a rarity
end

service.get_pokemon_types["data"].each do |pokemon_type|
  PokemonType.find_or_create_by!(name: pokemon_type)
end

service.get_card_sets["data"].each do |card_set_data|
  logo_image = Image.find_or_create_by!(image_url: card_set_data["images"]["logo"]) if card_set_data["images"]["logo"]

  CardSet.find_or_create_by!(
    name: card_set_data["name"],
    release_date: card_set_data["releaseDate"],
    logo: logo_image
  )
end

page_size = 250

card_sets_response = service.get_card_sets
all_card_sets = card_sets_response && card_sets_response["data"]

if all_card_sets.blank?
  puts "No sets returned from API!"
else
  all_card_sets.each do |card_set_data|
    logo_image = Image.find_or_create_by!(
      image_url: card_set_data.dig("images", "logo")
    ) if card_set_data["images"] && card_set_data["images"]["logo"] # only try this if a logo exists

    card_set = CardSet.find_or_create_by!(
      name: card_set_data["name"],
      series: card_set_data["series"],
      release_date: card_set_data["releaseDate"],
      logo: logo_image
    )

    puts "Seeding cards for set: #{card_set.name} (#{card_set.id})"

    page = 1
    loop do
      cards_response = service.get_cards("set.id:\"#{card_set_data['id']}\"", page, page_size)
      cards = cards_response && cards_response["data"]

      # if there are no cards on the page, exit the loop
      # we reached the end of the set
      break if cards.blank?

      cards.each do |card_data|
        supertype = Supertype.find_by(name: card_data["supertype"])

        # &. is the safe navigation operator ("call this method only if the object is not nil")
        # .strip to remove whitespace around a rarity type for cleaner db matches
        # if there is no card rarity, use N/A as the default
        rarity_name = card_data["rarity"]&.strip || "N/A"
        rarity = Rarity.find_by("LOWER(name) = ?", rarity_name.downcase)

        pokemon_type = PokemonType.find_by(name: card_data["types"]&.first)
        card_image = Image.find_or_create_by!(image_url: card_data.dig("images", "small"))

        card = Card.find_or_create_by!(
          name: card_data["name"],
          card_number: card_data["number"],
          healthpoints: card_data["hp"],
          supertype: supertype,
          rarity: rarity,
          pokemon_type: pokemon_type,
          card_set: card_set,
          image_url: card_image
        )

        # skip the looping if the card has no attacks
        next unless card_data["attacks"]

        card_data["attacks"].each do |attack_data|
          attack = Attack.find_or_create_by!(
            name: attack_data["name"],
            converted_energy_cost: attack_data["convertedEnergyCost"],
            damage: attack_data["damage"],
            text: attack_data["text"]
          )
          card.attacks << attack unless card.attacks.include?(attack)
        end
      end
      page += 1
    end
  end
end
