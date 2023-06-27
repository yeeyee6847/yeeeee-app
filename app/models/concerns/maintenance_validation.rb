module MaintenanceValidation
    extend ActiveSupport::Concern

    included do
        validates :value, presence: true
        validates_uniqueness_of :position
        validates :position, presence: true
    end

end