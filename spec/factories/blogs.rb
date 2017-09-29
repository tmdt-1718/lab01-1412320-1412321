FactoryGirl.define do
  factory :blog do
    content "MyText"
    user nil
    view_count 1
  end
end
