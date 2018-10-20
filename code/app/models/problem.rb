class Problem < ApplicationRecord
  belongs_to :topic
  has_many :options, dependent: :destroy
  validates :question, presence: true, length: { maximum: 500 }
  validates :answer, presence: true, length: { maximum: 500 }
  validates :remark, length: { maximum: 500 }
end
