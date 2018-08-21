# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'unirest'


response = Unirest.get "https://omgvamp-hearthstone-v1.p.mashape.com/cards/",
  headers:{
    "X-Mashape-Key" => "CImjFhoYcUmshYwUFhXlRhkcBExWp1W5M5qjsnPdxBRRY2PeT3"
          }


card_sets = response.body#hash that looks like "Set Name" => [{card_1_info},...,{card_n_info}]


# this code iterates over each array of cards and deletes irrelevant cards. Cleaner
# to delete unwanted cards than to make conditionals for keeping wanted cards
card_sets.each do |set,cards_array|
  cards_array.delete_if do |card|
     card["type"] == "Hero"
     || card["type"] == "Hero Power"
     || card["type"] == "Enchantment"
     || card["playerClass"] == nil
     || card["playerClass"] == "Dream"
     || card["playerClass" == "Death Knight"] 
     || card["cost"] == nil
  end
end



# at line 32 card_sets is still a hash with keys like "set" => [card,card,...,card].
# Following code simply puts all card arrays into a one dimensional array.
all_cards = []

card_sets.keys.each do |key|
  all_cards << card_sets[key]
end

all_cards = all_cards.flatten


# this code seeds the Card records/instances

all_cards.each do |card|
  Card.create(name:card["name"],
              img:card["img"],
              cost:card["cost"],
              attack:card["attack"],
              health:card["health"],
              rarity:card["rarity"],
              player_class:card["playerClass"],
              race:card["type"],
              card_set:card["cardSet"])
end
