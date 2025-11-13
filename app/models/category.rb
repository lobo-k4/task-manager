class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :nullify
  
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :color, presence: true
  
  # Colores predefinidos para Bootstrap
  COLORS = {
    primary: '#0d6efd',
    secondary: '#6c757d',
    success: '#198754', 
    danger: '#dc3545',
    warning: '#ffc107',
    info: '#0dcaf0',
    dark: '#212529'
  }
end