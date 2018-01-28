class Video < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :title, :description, :small_cover_url, :large_cover_url

  def self.search_by_title(title)
    Video.where("lower(title) LIKE ?", "%#{title.downcase}%")
  end
end
