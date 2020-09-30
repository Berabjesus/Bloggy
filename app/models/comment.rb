class Comment < ApplicationRecord
  belongs_to :blog
  validates_length_of :name, minimum: 2, maximum: 50, allow_blank: false
  validates_length_of :comment, minimum: 10, maximum: 5500, allow_blank: false
end
