class Keyword < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :result_type

  attr_accessible :name,
                  :result_type,
                  :rate,
                  :sentiment,
                  :reset_mention_history

  serialize :mentions, Array

  scope :daily,  -> { where(reset_mention_history: "daily") }
  scope :weekly, -> { where(reset_mention_history: "weekly") }
end
