class Pokemon

    attr_accessor :name, :attributes
  
    @@all = []
  
    def initialize(name, attributes)
        @name = name 
        @attributes = attributes
        @@all << self
    end
  
    def self.all
      @@all
    end

    def self.create_pokemon
        pokemon_name = nil 
        pokemon_attributes = nil 
        API.get_all_characters["results"].each do |pokemon_hash|
            pokemon_hash.each do |key, value|
                if key == "name"
                    pokemon_name = value 
                else
                    pokemon_attributes = value 
                end
            end
            Pokemon.new(pokemon_name, pokemon_attributes)
        end
    end

    def self.list_all_pokemon
        self.all.values_at(0..492).each.with_index do |pokemon, index|
            puts "#{index + 1}: #{pokemon.name}"
        end
    end

    def self.list_gen_I
        self.all.values_at(0..150).each.with_index do |pokemon, index|
            puts "#{index + 1}: #{pokemon.name}"
        end
    end

    def self.list_gen_II
        self.all.values_at(151..250).each.with_index(152) do |pokemon, index|
            puts "#{index}: #{pokemon.name}"
        end
    end

    def self.list_gen_III
        self.all.values_at(251..385).each.with_index(252) do |pokemon, index|
            puts "#{index}: #{pokemon.name}"
        end
    end

    def self.list_gen_IV
        self.all.values_at(386..492).each.with_index(387) do |pokemon, index|
            puts "#{index}: #{pokemon.name}"
        end
    end

    def self.stats(user_input)
        pokemon = RestClient.get(Pokemon.all[user_input].attributes)
        attributes_hash = JSON.parse(pokemon)
        puts "#{Pokemon.all[user_input].name.upcase}"
        attributes_hash["stats"].each do |key| 
            base_stat = nil 
            stat_name = nil
            key.each do |symbol, value|
                if symbol == "base_stat"
                    base_stat = value 
                end
                if symbol == "stat"
                    stat_name = key[symbol]["name"]
                end 
            end
            puts "#{stat_name}: #{base_stat}"
        end
    end

  end
  