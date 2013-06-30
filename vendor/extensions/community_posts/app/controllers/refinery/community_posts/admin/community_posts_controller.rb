module Refinery
  module CommunityPosts
    module Admin
      class CommunityPostsController < ::Refinery::AdminController

        crudify :'refinery/community_posts/community_post',
                :title_attribute => 'blog_name', :xhr_paging => true

      end
    end
  end
end
