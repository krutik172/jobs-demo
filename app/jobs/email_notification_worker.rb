class EmailNotificationWorker
  include Sidekiq::Worker

  def perform(user_id)
    binding.pry
    user = User.find(user_id)
    UserMailer.welcome_email(user).deliver_now
  end
end
