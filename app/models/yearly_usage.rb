class YearlyUsage < ApplicationRecord

    
    validates_uniqueness_of :year
    validates :year, presence: true
end
