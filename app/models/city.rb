class City < ApplicationRecord
    has_many :doctors #Ville  peut avoir plusieurs DOC/PAT/RDV
    has_many :patients
    has_many :appointments
end
