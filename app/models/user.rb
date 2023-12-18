class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  after_create :welcome_email

  def welcome_email
    binding.pry
    EmailNotificationWorker.perform_async(self.id)
  end
end
