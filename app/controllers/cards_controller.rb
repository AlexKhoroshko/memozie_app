class CardsController < ApplicationController
  before_action :set_deck

  before_action :set_card, only: %i[show edit update destroy change_status]

  # GET decks/1/cards
  def index
    @cards = @deck.cards
  end

  # GET decks/1/cards/1
  def show; end

  # GET decks/1/cards/new
  def new
    @card = @deck.cards.build
  end

  # GET decks/1/cards/1/edit
  def edit; end

  # POST decks/1/cards
  def create
    @card = @deck.cards.build(card_params)

    if @card.save
      redirect_to(deck_url(@deck), notice: 'Card was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT decks/1/cards/1
  def update
    if @card.update_attributes(card_params)
      redirect_to(deck_url(@deck), notice: 'Card was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE decks/1/cards/1
  def destroy
    @card.destroy

    redirect_to deck_url(@deck)
  end

  def change_status
    card = Card.find(params[:id])
    time = case params[:commit]
           when 'Wrong 1 min'
             1
           when 'Good 10 min'
             10
           when 'Exelent 30 min'
             30
           end
    card.inactive!
    ChangeStatusWorker.perform_in(time.to_i.minutes, card.id)
    redirect_to review_deck_path(@deck)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def set_card
    @card = @deck.cards.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def card_params
    params.require(:card).permit(:front, :back, :status, :deck_id, :image)
  end
end
