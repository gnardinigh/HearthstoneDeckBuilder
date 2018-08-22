
require 'unirest'
require 'httparty'
require 'pry'


response = Unirest.get "https://omgvamp-hearthstone-v1.p.mashape.com/cards/",
  headers:{
    "X-Mashape-Key" => "CImjFhoYcUmshYwUFhXlRhkcBExWp1W5M5qjsnPdxBRRY2PeT3"
          }

heroes = response.body["Basic"].select{|card| card["cardId"].include?("HERO")}

binding.pry
0

#
# > ["Basic",
#  "Classic",
#  "Promo",
#  "Hall of Fame",
#  "Naxxramas",
#  "Goblins vs Gnomes",
#  "Blackrock Mountain",
#  "The Grand Tournament",
#  "The League of Explorers",
#  "Whispers of the Old Gods",
#  "One Night in Karazhan",
#  "Mean Streets of Gadgetzan",
#  "Journey to Un'Goro",
#  "Knights of the Frozen Throne",
