class YearlyUsage < ApplicationRecord
    has_many :monthly_usages, dependent: :destroy

    validates_uniqueness_of :year
    validates :year, presence: true

    after_create :create_monthly_usages

    def create_monthly_usages
        months = Month.all
        months.each do | month |
            monthly_usages.create(yearly_usage: self, month: month)
        end        
    end
    
end
