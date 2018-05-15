class Currency < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  belongs_to :user
end
