class Video < ActiveRecord::Base
  validates_presence_of :title, :description, :small_cover_url, :large_cover_url
end
