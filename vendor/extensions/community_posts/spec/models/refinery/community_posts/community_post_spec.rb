require 'spec_helper'

module Refinery
  module CommunityPosts
    describe CommunityPost do
      describe "validations" do
        subject do
          FactoryGirl.create(:community_post,
          :blog_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:blog_name) { should == "Refinery CMS" }
      end
    end
  end
end
