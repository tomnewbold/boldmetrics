class Application < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :user, presence: true
end
