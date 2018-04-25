class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_many :comments, as: :parent, dependent: :destroy
end
