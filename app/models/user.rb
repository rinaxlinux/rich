class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :profiles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_profiles, through: :likes, source: :profile
  has_many :profiles, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  def already_liked?(profile)
    self.likes.exists?(profile_id: profile.id)
  end

end
