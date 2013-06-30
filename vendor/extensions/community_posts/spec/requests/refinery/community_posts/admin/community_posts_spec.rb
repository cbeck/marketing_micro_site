# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CommunityPosts" do
    describe "Admin" do
      describe "community_posts" do
        login_refinery_user

        describe "community_posts list" do
          before do
            FactoryGirl.create(:community_post, :blog_name => "UniqueTitleOne")
            FactoryGirl.create(:community_post, :blog_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.community_posts_admin_community_posts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.community_posts_admin_community_posts_path

            click_link "Add New Community Post"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Blog Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::CommunityPosts::CommunityPost.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Blog Name can't be blank")
              Refinery::CommunityPosts::CommunityPost.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:community_post, :blog_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.community_posts_admin_community_posts_path

              click_link "Add New Community Post"

              fill_in "Blog Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::CommunityPosts::CommunityPost.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:community_post, :blog_name => "A blog_name") }

          it "should succeed" do
            visit refinery.community_posts_admin_community_posts_path

            within ".actions" do
              click_link "Edit this community post"
            end

            fill_in "Blog Name", :with => "A different blog_name"
            click_button "Save"

            page.should have_content("'A different blog_name' was successfully updated.")
            page.should have_no_content("A blog_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:community_post, :blog_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.community_posts_admin_community_posts_path

            click_link "Remove this community post forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::CommunityPosts::CommunityPost.count.should == 0
          end
        end

      end
    end
  end
end
