class Video < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :title, :description, :small_cover_url, :large_cover_url
end
