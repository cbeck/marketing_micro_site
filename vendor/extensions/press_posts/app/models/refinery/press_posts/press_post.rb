module Refinery
  module PressPosts
    class PressPost < Refinery::Core::BaseModel
      self.table_name = 'refinery_press_posts'

      attr_accessible :name, :url, :description, :image_id, :position

      acts_as_indexed :fields => [:name, :url, :description]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
