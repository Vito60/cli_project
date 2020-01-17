class API
  @BASE_URL = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=493"

  def self.get_all_characters
    response = RestClient.get(@BASE_URL)
    JSON.parse(response)
  end

end


