class DecksController < ApplicationController
  before_action :set_deck, only: %i[show edit update destroy review]

  # GET /decks
  # GET /decks.json
  def index
    @decks = current_user.decks
  end

  # GET /decks/1
  # GET /decks/1.json
  def show; end

  # GET /decks/new
  def new
    @deck = current_user.decks.build
  end

  # GET /decks/1/edit
  def edit; end

  # POST /decks
  # POST /decks.json
  def create
    @deck = current_user.decks.build(deck_params)
    respond_to do |format|
      if @deck.save
        format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
        format.json { redirect_to decks_url, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { redirect_to decks_url, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def review
    @cards = @deck.cards.to_review
    if @cards.length.zero?
      flash[:alert] = 'Nothing to review'
      redirect_to decks_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deck
    @deck = Deck.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deck_params
    params.require(:deck).permit(:title, :description, :user_id)
  end
end
