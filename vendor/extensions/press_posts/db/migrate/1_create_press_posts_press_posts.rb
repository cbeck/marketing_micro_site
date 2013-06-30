class CreatePressPostsPressPosts < ActiveRecord::Migration

  def up
    create_table :refinery_press_posts do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-press_posts"})
    end

    drop_table :refinery_press_posts

  end

end
