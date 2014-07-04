class Card < ActiveRecord::Base
  belongs_to :deck
  validates :front, presence: true, uniqueness: true
  validates :back, presence: true
end
