class Doctor < ApplicationRecord
    belongs_to :city, optional: true #optional pour eviter les rollback
    has_many :jointures #doctor peut avoir plusieurs spe
    has_many :specialties, through: :jointures
    has_many :appointments #doctor peut avoir plusieurs RDV
    has_many :patients, through: :appointments
end
