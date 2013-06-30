# This migration comes from refinery_community_posts (originally 1)
class CreateCommunityPostsCommunityPosts < ActiveRecord::Migration

  def up
    create_table :refinery_community_posts do |t|
      t.string :blog_name
      t.string :blog_url
      t.string :author_name
      t.string :author_twitter_name
      t.text :description
      t.string :article_url
      t.integer :author_image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-community_posts"})
    end

    drop_table :refinery_community_posts

  end

end
