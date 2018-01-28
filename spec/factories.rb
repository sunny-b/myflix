FactoryBot.define do
  factory :category do
    name 'Name'
  end

  factory :video do
    title 'Title'
    description 'Description'
    small_cover_url 'cover_url'
    large_cover_url 'large_cover_url'
    category
  end
end
