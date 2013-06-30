module Refinery
  module CommunityPosts
    class CommunityPost < Refinery::Core::BaseModel
      self.table_name = 'refinery_community_posts'

      attr_accessible :blog_name, :blog_url, :author_name, :author_twitter_name, :description, :article_url, :author_image_id, :position

      acts_as_indexed :fields => [:blog_name, :blog_url, :author_name, :author_twitter_name, :description, :article_url]

      validates :blog_name, :presence => true, :uniqueness => true

      belongs_to :author_image, :class_name => '::Refinery::Image'
      
      default_scope :order => :position
    end
  end
end
