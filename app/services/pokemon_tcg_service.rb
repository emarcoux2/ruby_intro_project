# encoding: utf-8

require "net/http"
require "uri"
require "json"

class PokemonTcgService
  BASE_URL = "https://api.pokemontcg.io/v2"

  def initialize
    @api_key = ENV["POKEMON_TCG_API_KEY"]
  end

  def get_cards(query = nil, page = 1, page_size = 250)
    uri = URI("#{BASE_URL}/cards")

    params = { "page" => page, "pageSize" => page_size }
    params[:q] = query if query.present?

    uri.query = URI.encode_www_form(params)

    response = make_request(uri)
    handle_response(response)
  end

  def get_card(id)
    uri = URI("#{BASE_URL}/cards/#{id}")
    response = make_request(uri)
    handle_response(response)
  end

  def get_supertypes
    uri = URI("#{BASE_URL}/supertypes")
    response = make_request(uri)
    handle_response(response)
  end

  def get_rarities
    uri = URI("#{BASE_URL}/rarities")
    response = make_request(uri)
    handle_response(response)
  end

  def get_card_sets
    uri = URI("#{BASE_URL}/sets")
    response = make_request(uri)
    handle_response(response)
  end

  def get_pokemon_types
    uri = URI("#{BASE_URL}/types")
    response = make_request(uri)
    handle_response(response)
  end

  private

  def make_request(uri)
    request = Net::HTTP::Get.new(uri)
    request["X-Api-Key"] = @api_key

    Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
  # rescue catches and handles exceptions during runtime and prevents the whole app from crashing
  rescue StandardError => e
    Rails.logger.error "Request failed: #{e.message}"
    nil
  end

  def handle_response(response)
    return { "error" => "No response received" } if response.nil?

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      { "error" => "Request failed", "status" => response.code, "body" => response.body }
    end
  rescue JSON::ParserError => e
    Rails.logger.error "Invalid JSON: #{e.message}"
    { "error" => "Invalid JSON response" }
  end
end
