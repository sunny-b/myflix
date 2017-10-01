require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:small_cover_url) }
  it { should validate_presence_of(:large_cover_url) }

  describe '#search_by_title' do
    it 'returns empty array if no matches found' do
      Video.create!(title: 'Futurama', description: 'test', small_cover_url: 'test', large_cover_url: 'test')
      Video.create!(title: 'Back to Future', description: 'test', small_cover_url: 'test', large_cover_url: 'test')

      expect(Video.search_by_title('nothing')).to match_array([])
    end

    it 'returns empty array if query is blank' do
      Video.create!(title: 'Futurama', description: 'test', small_cover_url: 'test', large_cover_url: 'test')
      Video.create!(title: 'Back to Future', description: 'test', small_cover_url: 'test', large_cover_url: 'test')

      expect(Video.search_by_title('')).to match_array([])
    end

    it 'returns an array with single item when exact match' do
      todo = Video.create!(title: 'Futurama', description: 'test', small_cover_url: 'test', large_cover_url: 'test')
      todo1 = Video.create!(title: 'Back to Future', description: 'test', small_cover_url: 'test', large_cover_url: 'test')

      expect(Video.search_by_title('Futurama')).to match_array([todo])
    end

    it 'returns an array with single item when partial match' do
      todo = Video.create!(title: 'Futurama', description: 'test', small_cover_url: 'test', large_cover_url: 'test')
      todo1 = Video.create!(title: 'Back to Future', description: 'test', small_cover_url: 'test', large_cover_url: 'test')

      expect(Video.search_by_title('Futura')).to match_array([todo])
    end

    it 'returns an array with multiple items when multiple items match, ordered by creation date' do
      todo = Video.create!(title: 'Futurama', description: 'test', small_cover_url: 'test', large_cover_url: 'test')
      todo1 = Video.create!(title: 'Back to Future', description: 'test', small_cover_url: 'test', large_cover_url: 'test')

      expect(Video.search_by_title('Futur')).to match_array([todo, todo1])
    end
  end
end
