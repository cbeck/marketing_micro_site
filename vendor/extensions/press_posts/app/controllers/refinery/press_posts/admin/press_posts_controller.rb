module Refinery
  module PressPosts
    module Admin
      class PressPostsController < ::Refinery::AdminController

        crudify :'refinery/press_posts/press_post',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
