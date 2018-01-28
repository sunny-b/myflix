require 'spec_helper'

describe Category do
  it { should have_many :videos }
  it { should validate_presence_of :name }

  describe '.recent_videos' do
    it 'should return empty array if no videos' do
      crime = create(:category, name: 'TV Crime')

      expect(crime.recent_videos).to eq([])
    end

    it 'should return videos in reverse chronological order' do
      crime = create(:category, name: 'TV Crime')
      video1 = create(:video, category: crime)
      video2 = create(:video, category: crime)
      video3 = create(:video, category: crime)

      expect(crime.recent_videos).to eq([video3, video2, video1])
    end

    it 'should return a max of 6 recent videos' do
      crime = create(:category, name: 'TV Crime')
      video1 = create(:video, category: crime)
      video2 = create(:video, category: crime)
      video3 = create(:video, category: crime)
      video4 = create(:video, category: crime)
      video5 = create(:video, category: crime)
      video6 = create(:video, category: crime)
      video7 = create(:video, category: crime)

      expect(crime.recent_videos.length).to eq(6)
    end

    it 'should return all videos if less than 6' do
      crime = create(:category, name: 'TV Crime')
      video1 = create(:video, category: crime)
      video2 = create(:video, category: crime)
      video3 = create(:video, category: crime)
      video4 = create(:video, category: crime)
      video5 = create(:video, category: crime)

      expect(crime.recent_videos.length).to eq(5)
    end


  end
end
