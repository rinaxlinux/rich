class Like < ApplicationRecord

  belongs_to :profile
  belongs_to :user

  validates_uniqueness_of :profile_id, scope: :user_id

end
