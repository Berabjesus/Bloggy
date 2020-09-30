class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all 
  validates_length_of :title, minimum: 5, maximum: 50, allow_blank: false
  validates_length_of :content, minimum: 10, maximum: 5500, allow_blank: false
end
