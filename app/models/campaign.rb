class Campaign < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :parent, dependent: :destroy
  has_many :todos, dependent: :destroy
end
