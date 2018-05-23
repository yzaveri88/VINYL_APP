class Record < ApplicationRecord
  belongs_to :user
  has_many :bookings

def self.search(search)
  if search
    find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end
