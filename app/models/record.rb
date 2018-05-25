class Record < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, :reviews, dependent: :destroy
  mount_uploader :photo, PhotoUploader

    include PgSearch
    pg_search_scope :search_by_title_and_artist,
      against: [ :title, :artist ],
      using: {
        tsearch: { prefix: true }
      }

  attr_accessor :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode

  private

  def city_name
     self.city.name
   end

end
