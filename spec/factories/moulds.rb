FactoryGirl.define do
  factory :mould do
    name 'example'
    image { File.new("#{Rails.root}/spec/fixtures/images/example.png") }
  end
end
