service = PokemonTcgService.new

CardAttack.destroy_all if defined?(CardAttack)
Attack.destroy_all
Card.destroy_all
CardSet.destroy_all
Image.destroy_all
Supertype.destroy_all
Rarity.destroy_all
PokemonType.destroy_all

service.get_supertypes["data"].each do |supertype|
  Supertype.find_or_create_by!(name: supertype)
end

service.get_rarities["data"].each do |rarity|
  Rarity.find_or_create_by!(name: rarity)
end
Rarity.find_or_create_by!(name: "N/A")

service.get_pokemon_types["data"].each do |pokemon_type|
  PokemonType.find_or_create_by!(name: pokemon_type)
end

card_sets_response = service.get_card_sets
all_card_sets = card_sets_response&.dig("data") || []

if all_card_sets.empty?
  puts "No sets returned from API."
else
  all_card_sets.each_with_index do |card_set_data, index|
    logo_image = Image.find_or_create_by!(image_url: card_set_data.dig("images", "logo")) if card_set_data.dig("images", "logo")

    card_set = CardSet.find_or_create_by!(
      name: card_set_data["name"],
      series: card_set_data["series"],
      release_date: card_set_data["releaseDate"],
      logo: logo_image
    )

    page = 1
    page_size = 250
    loop do
      cards_response = service.get_cards("set.id:\"#{card_set_data['id']}\"", page, page_size)
      cards = cards_response&.dig("data") || []
      break if cards.empty?

      cards.each do |card_data|
        supertype = Supertype.find_by(name: card_data["supertype"])
        rarity_name = card_data["rarity"]&.strip || "N/A"
        rarity = Rarity.find_by("LOWER(name) = ?", rarity_name.downcase)
        pokemon_type = PokemonType.find_by(name: card_data["types"]&.first)
        card_image = Image.find_or_create_by!(image_url: card_data.dig("images", "small")) if card_data.dig("images", "small")

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

        if card_data["attacks"]
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
      end
      page += 1
    end
  end
end
