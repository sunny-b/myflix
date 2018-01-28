require 'spec_helper'

describe Video do
  it { should belong_to :category }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :small_cover_url }
  it { should validate_presence_of :large_cover_url }

  describe ".search_by_title" do
    it "returns empty array if no matches" do
      video = Video.create(title: 'Monk',
                        description: 'Detective show',
                        small_cover_url: 'here.com',
                        large_cover_url: 'here.com')

      expect(Video.search_by_title('South')).to eq([])
    end

    it "returns a single match if there is only one match" do
      video = Video.create(title: 'Monk',
                        description: 'Detective show',
                        small_cover_url: 'here.com',
                        large_cover_url: 'here.com')
      futurama = Video.create(title: 'Futurama',
                        description: 'Detective show',
                        small_cover_url: 'here.com',
                        large_cover_url: 'here.com')

      expect(Video.search_by_title('Monk')).to eq([video])
    end

    it 'returns multiple matches if there are many matches' do
      video = Video.create(title: 'South Park',
                        description: 'Detective show',
                        small_cover_url: 'here.com',
                        large_cover_url: 'here.com')
      futurama = Video.create(title: 'Futurama',
                        description: 'Detective show',
                        small_cover_url: 'here.com',
                        large_cover_url: 'here.com')

      expect(Video.search_by_title('u')).to eq([video, futurama])
    end
  end
end
