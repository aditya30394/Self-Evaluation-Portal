class Option < ApplicationRecord
    belongs_to :problem
    validates :answer, presence: true
end
