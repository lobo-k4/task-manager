class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  
  # NUEVA SINTXIS PARA RAILS 8.1+
  enum :status, { pending: 0, in_progress: 1, completed: 2 }, default: :pending
  enum :priority, { low: 0, medium: 1, high: 2 }, default: :medium
  
  validates :title, presence: true
  validates :due_date, presence: true
  
  scope :overdue, -> { where('due_date < ? AND status != ?', Time.current, 2) } # 2 = completed
  scope :due_today, -> { where(due_date: Time.current.all_day) }
  scope :by_priority, -> { order(priority: :desc) }
  scope :by_category, ->(category_id) { where(category_id: category_id) if category_id.present? }
  
  def overdue?
    due_date < Time.current && status != 'completed'
  end
end