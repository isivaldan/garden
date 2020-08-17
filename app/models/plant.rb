class Plant < ApplicationRecord
  has_many :waterings , dependent: :destroy

  def to_s
    name
  end
  def total_volume
    waterings.pluck(:volume).reduce(&:+)
  end
  def total_watering
    waterings.count
  end
  def daily_quantity
    waterings.where(created_at: Date.today.beginning_of_day ..Date.today.end_of_day).count
  end
  def last_watering
    waterings.last&.created_at&.to_date
  end
  def daily_volume
    waterings.where(created_at: Date.today.beginning_of_day ..Date.today.end_of_day).pluck(:volume).reduce(&:+)
  end
  def daily_minutes 
    waterings.where(created_at: Date.today.beginning_of_day ..Date.today.end_of_day).pluck(:minutes).reduce(&:+)
    
  end
end
