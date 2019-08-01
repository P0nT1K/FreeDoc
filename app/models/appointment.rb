class Appointment < ApplicationRecord
    belongs_to :doctor # Un DOC et un PAT par RDV
    belongs_to :patient
    belongs_to :city, optional: true #optional permet d'eviter les rollback
end
