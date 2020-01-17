require "Pokemon_cli_app/version"
require_relative "./pokemon_cli_app/version"
require_relative './pokemon_cli_app/pokemon'
require_relative './pokemon_cli_app/api'
require_relative './pokemon_cli_app/cli.rb'

module PokemonCliApp
  class Error < StandardError; end
  # Your code goes here...
end
