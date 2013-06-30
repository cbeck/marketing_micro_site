
FactoryGirl.define do
  factory :community_post, :class => Refinery::CommunityPosts::CommunityPost do
    sequence(:blog_name) { |n| "refinery#{n}" }
  end
end

