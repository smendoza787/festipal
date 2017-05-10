class FestivalArtist < ActiveRecord::Base
  belongs_to :festival
  belongs_to :artist
end
