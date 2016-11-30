class Skill < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests
end
