
FactoryGirl.define do
  factory :press_post, :class => Refinery::PressPosts::PressPost do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

