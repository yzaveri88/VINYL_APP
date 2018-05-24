class Record < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings

    include PgSearch
    pg_search_scope :search_by_title_and_artist,
      against: [ :title, :artist ],
      using: {
        tsearch: { prefix: true }
      }

  attr_accessor :city_name, :latitude, :longitude
  geocoded_by :city_name
  after_validation :geocode

  private
  def city_name
    self.city.name
  end

end
