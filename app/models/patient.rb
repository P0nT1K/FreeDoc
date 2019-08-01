class Patient < ApplicationRecord
   has_many :appointments #PAT peut avoir plusieurs RDV et plusieurs DOC
   has_many :doctors, through: :appointments #le lien entre DOC et PAT via le RDV
   belongs_to :city, optional: true
end
