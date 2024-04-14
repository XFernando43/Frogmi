class Report < ApplicationRecord

    include WillPaginate::CollectionMethods

    validates :identifier, presence: true, uniqueness: true
    validates :title, :url, :place, :mag_type, presence: true
    validates :mag, inclusion: { in: -1.0..10.0, message: "must be between -1.0 and 10.0" }
    validates :latitude, inclusion: { in: -90.0..90.0, message: "must be between -90.0 and 90.0" }
    validates :longitude, inclusion: { in: -180.0..180.0, message: "must be between -180.0 and 180.0" }
end
