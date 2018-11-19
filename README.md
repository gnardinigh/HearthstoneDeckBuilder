# Hearthstone Deck Creator

Hearthstone Deck Creator is Rails web app that lets users group Hearthstone playing cards into decks of 30.
Users can save, compare, and edit their decks. In the actual Hearthstone game, players can create decks
in similar fashion but the game's deck creator UI/UX is cumbersome. This web app is therefore meant to be a 
fast and easy way to experiment with deck composition outside of the game.

Both the frontend and backend are written with Ruby on Rails, so all of the views are written in HTML with
embedded Ruby code. However, using the site you'll notice dynamic features on the screens, including card
enlargment on hover and a deck roster pane that updates immediately when a new card is added to a deck. 
This is all done by using a JavaScript script to manipulate the DOM elements we created in our html-erb
files. Although Ruby on Rails apps have their limitations, you can still use Rails to build interactive 
WebApps that fit the user-interactive 'Web 2.0' paradigm!

## Getting Started

Fork and clone this repo. 

To run this software locally you'll have to seed the database with card information. Register an account
with mashape and enter your API key into the seeds file in the response object. If you need to push your 
clone to gibhut for any reason **remember to delete your key beforehand**

Since our seeding algorithm uses HTTP response types to clean off card data we don't want, seeding may 
take a while depending on your internet connection. If you want to track seeding progress, I added
some console logs to print out the current card set your cleaning. If you want more detailed tracking
you can alter the card_sets iterator in line 25 of the seeds.rb file to print any milestone you'd like.

### Installing

Fork and clone

rake db:create
rake db:migrate
rake db:seed
rails s

use rails console to explore the card data and
view image sources

## Acknowledgments

* My project partner Tyler Nodell, who also loves Hearthstone!

## Screen Caps

### Choose a hero for your deck
![choose hero](./readmeimgs/hs1.png)
### Select cards from your hero's class...
![choose class card](./readmeimgs/hs2.png)
### ...or from the neutral card base!
![choose neutral card](./readmeimgs/hs3.png)
### Preview your decks from your deck library
![view deck](./readmeimgs/hs4.png)