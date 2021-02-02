class ChangeStatusWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  def perform(count)
    Card.create(front: 'a', back:'b')
  end
end