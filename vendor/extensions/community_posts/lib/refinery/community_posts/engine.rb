module Refinery
  module CommunityPosts
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::CommunityPosts

      engine_name :refinery_community_posts

      initializer "register refinerycms_community_posts plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "community_posts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.community_posts_admin_community_posts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/community_posts/community_post',
            :title => 'blog_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CommunityPosts)
      end
    end
  end
end
