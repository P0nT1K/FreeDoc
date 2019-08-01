class Specialty < ApplicationRecord
    has_many :jointures
    has_many :doctors, through: :jointures
end
