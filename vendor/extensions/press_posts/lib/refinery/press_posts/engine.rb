module Refinery
  module PressPosts
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::PressPosts

      engine_name :refinery_press_posts

      initializer "register refinerycms_press_posts plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "press_posts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.press_posts_admin_press_posts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/press_posts/press_post',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PressPosts)
      end
    end
  end
end
