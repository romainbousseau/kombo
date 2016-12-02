class Match < ApplicationRecord
  belongs_to :problem_user, :class_name => 'User'
  belongs_to :solver_user, :class_name => 'User'
  has_many :messages
end
