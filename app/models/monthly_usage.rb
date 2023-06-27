class MonthlyUsage < ApplicationRecord
  belongs_to :yearly_usage
  belongs_to :month
  has_many :daily_usages, dependent: :destroy

  after_create :create_daily_usages

  def create_daily_usages
    start_date = Date.new(yearly_usage.year, month.position, 1)
    end_date = start_date.end_of_month

    (start_date..end_date).each do | date |
      daily_usages.create(monthly_usage: self, date: date)
    end
  end

  def self.get_current_monthly_usage(yearly_usage)
    where(yearly_usage: yearly_usage, month: Date.today.month).first
  end

end
