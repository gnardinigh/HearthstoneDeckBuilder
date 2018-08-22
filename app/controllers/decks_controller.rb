class DecksController < ApplicationController

  def index
    @cards = Card.all

  end

  def new
    @chosen_class = params[:commit]
    @cards = Card.player_class(@chosen_class)
    @neutral_cards = Card.player_class("Neutral")
    @selection_range = [{num:0},{num:1},{num:2}]
  end

  def add_to_deck

  end

  def create
    byebug
  end




end
