class Problem < ApplicationRecord
  belongs_to :topic
  belongs_to :question_type, optional: true
  has_many :options, dependent: :destroy
  has_many :links, dependent: :destroy
  validates :question, presence: true, length: { maximum: 500 }
  validates :remark, length: { maximum: 500 }
end
