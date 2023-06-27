class ExpenseItem < ApplicationRecord
  belongs_to :daily_usage
  belongs_to :spending_type, optional: true

  validates :spending_type, presence: true
  validates :expense_item, presence: true
  validates :amount, presence: true
  # validates :amount, numericality: { greater_than_or_equal_to: 0}

  after_create :update_usage_total_amount
  after_update :update_usage_total_amount
  after_destroy :update_usage_total_amount

  private 
  def update_usage_total_amount
    daily_usage.update_attribute(:total_amount, daily_usage.expense_items.sum(:amount))
    daily_usage.monthly_usage.update_attribute(:total_amount, daily_usage.monthly_usage.daily_usages.sum(:total_amount))
    daily_usage.monthly_usage.yearly_usage.update_attribute(:total_amount, daily_usage.monthly_usage.yearly_usage.monthly_usages.sum(:total_amount))
  end
  
end
