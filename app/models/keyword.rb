class Keyword < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :result_type
end
