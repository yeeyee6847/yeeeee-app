class DailyUsage < ApplicationRecord
  belongs_to :monthly_usage
  belongs_to :daily_status, optional: true
  has_many :expense_items

  validates :daily_status, presence: true

  def self.get_today_daily_usage
    where(date: Date.today).first
  end

  def self.get_daily_usage_daily_status_is_null_by_date_range(monthly_usage, from, to)
    where("daily_usages.date >= ? AND daily_usages.date <= ?", from, to).where(daily_status: nil).where(monthly_usage: monthly_usage)
  end
end
