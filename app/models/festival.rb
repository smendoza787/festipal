class Festival < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  has_many :festival_artists
  has_many :artists, through: :festival_artists
  has_many :festival_users
  has_many :users, through: :festival_users
end
