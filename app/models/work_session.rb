class WorkSession < ApplicationRecord
  belongs_to :problem_user, :class_name => 'User', :foreign_key => 'problem_user_id'
  belongs_to :solver_user, :class_name => 'User', :foreign_key => 'solver_user_id'
  has_many :messages, dependent: :nullify
  validates :starts_at, presence: true
  validates :brief, presence: true
end
