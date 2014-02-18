class User < ActiveRecord::Base
  has_many :keywords

  validates :uid, presence: true, uniqueness: true

  attr_accessible :waitlist

  scope :active,   -> { where(waitlist: "false") }
  scope :inactive, -> { where(waitlist: "true") }

  def self.create_from_auth_hash(auth_hash)
    create! do |user|
      user.provider = auth_hash['provider']
      user.uid = auth_hash['uid']
      if auth_hash['info']
        user.nickname = auth_hash['info']['nickname']
        user.name = auth_hash['info']['name']
        user.location = auth_hash['info']['location']
        user.image = auth_hash['info']['image']
        user.description = auth_hash['info']['description']

        user.token = auth_hash['credentials']['token']
        user.secret = auth_hash['credentials']['secret']
      end
    end
  end
end
