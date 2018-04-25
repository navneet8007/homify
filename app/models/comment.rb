class Comment < ApplicationRecord
  belongs_to :parent, polymorphic: true, optional: true
  belongs_to :user
end
