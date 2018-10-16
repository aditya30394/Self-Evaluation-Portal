class Problem < ApplicationRecord
  belongs_to :topic
  validates :question, presence: true, length: { maximum: 500 }
  validates :answer, presence: true, length: { maximum: 500 }
  validates :remark, length: { maximum: 500 }
end
