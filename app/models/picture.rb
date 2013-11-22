class Picture < ActiveRecord::Base
  belongs_to :user

  validates :image_url, :presence => true
  validates :user, :presence => true
end
