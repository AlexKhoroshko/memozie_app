class ChangeStatusWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  def perform(id)
  	card = Card.find(id)
  	card.active!
  end
end