require 'spec_helper'
require 'capybara/rspec'

feature 'user can search for video using search form', type: :feature do
  before(:each) do
    categories = ['TV Comedies', 'TV Crime']

    categories.each do |name|
      Category.create!(name: name)
    end

    videos = [
      ['Family Guy', 'Animated show about a typical American family', '/tmp/family_guy.jpg', "http://dummyimage.com/665x375/000000/00a2ff", 1],
      ['Monk', 'Detective Show', '/tmp/monk.jpg', '/tmp/monk_large.jpg', 2],
    ]

    videos.each do |title, description, small_cover_url, large_cover_url, category_id|
      Video.create!(title: title, description: description, small_cover_url: small_cover_url, large_cover_url: large_cover_url, category_id: category_id)
    end
  end

  scenario 'user can see the search form on the index page' do
    visit home_path
    expect(page).to have_button('Search')
  end

  # scenario 'user can see videos on home page' do
  #   visit home_path
  #   save_and_open_page
  #   expect(page).to have_selector('.video', count: 2)
  # end
  #
  # scenario 'user only sees matching videos when searching' do
  #   visit home_path
  #   fill_in('search', with: 'Monk')
  #   click_button('Search')
  #   expect(page).to have_selector('.video', count: 1)
  # end
end
