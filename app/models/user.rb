class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :confirmable, :lockable, :zxcvbnable

  has_one :address

  has_many :books, dependent: :destroy
  has_many :genres, through: :books

  has_many :articles, dependent: :destroy

  has_many :event_participations
  has_many :events, through: :event_participations

  has_many :comments

  has_many :projects

  delegate :street, :city, to: :address

  after_create :assign_user_role

  def send_devise_notification notification, *args
    devise_mailer.send(notification, self, *args).deliver_later
  end

  private

  def assign_user_role
    self.add_role "user"
  end


end
