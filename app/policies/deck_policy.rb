class DeckPolicy < ApplicationPolicy
  attr_reader :user, :deck

  def initialize(user, deck)
    @user = user
    @deck = deck
  end

  def edit?
    deck.user == user
  end
end
