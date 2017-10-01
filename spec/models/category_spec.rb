require 'spec_helper'

describe Category do
 it { should have_many(:videos) }
 it { should validate_presence_of(:name) }

 describe '#recent_videos' do
   before(:each) do
     @category = Category.create!(name: 'test')
   end
   it 'returns an empty array if there are no videos' do
     expect(@category.recent_videos).to match_array([])
   end

   it 'returns an array of videos ordered by add date' do
     video = Video.create!(title: 'Futurama', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video1 = Video.create!(title: 'Back to Future', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)

     expect(@category.recent_videos).to eq([video1, video])
   end

   it 'returns all videos if there are less than 6 videos' do
     video = Video.create!(title: 'Futurama', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video1 = Video.create!(title: 'Back to Future', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video2 = Video.create!(title: 'Futurama1', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video3 = Video.create!(title: 'Back to Future1', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)

     expect(@category.recent_videos).to eq([video3, video2, video1, video])
   end

   it 'returns most recent 6 videos if there are more than 6 videos' do
     video = Video.create!(title: 'Futurama', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video1 = Video.create!(title: 'Back to Future', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video2 = Video.create!(title: 'Futurama1', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video3 = Video.create!(title: 'Back to Future1', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video4 = Video.create!(title: 'Futurama2', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video5 = Video.create!(title: 'Back to Future2', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video6 = Video.create!(title: 'Futurama3', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)
     video7 = Video.create!(title: 'Back to Future3', description: 'test', small_cover_url: 'test', large_cover_url: 'test', category: Category.first)

     expect(@category.recent_videos).to eq([video7, video6, video5, video4, video3, video2])
   end
 end
end
