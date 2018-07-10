class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  has_many :users, -> { distinct }, through: :likes
  has_many :ideas, -> { distinct }, through: :likes
end
