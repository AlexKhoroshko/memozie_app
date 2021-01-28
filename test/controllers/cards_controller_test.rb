require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  setup do
    @deck = decks(:one)
    @card = cards(:one)
  end

  test "should get index" do
    get :index, params: { deck_id: @deck }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { deck_id: @deck }
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post :create, params: { deck_id: @deck, card: @card.attributes }
    end

    assert_redirected_to deck_card_path(@deck, Card.last)
  end

  test "should show card" do
    get :show, params: { deck_id: @deck, id: @card }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { deck_id: @deck, id: @card }
    assert_response :success
  end

  test "should update card" do
    put :update, params: { deck_id: @deck, id: @card, card: @card.attributes }
    assert_redirected_to deck_card_path(@deck, Card.last)
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete :destroy, params: { deck_id: @deck, id: @card }
    end

    assert_redirected_to deck_cards_path(@deck)
  end
end
