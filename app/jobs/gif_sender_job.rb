class GifSenderJob < ApplicationJob
  queue_as :default

  def perform(email, thought)
    UserNotifierMailer.send_randomness_email(email, thought).deliver_now
  end
end
