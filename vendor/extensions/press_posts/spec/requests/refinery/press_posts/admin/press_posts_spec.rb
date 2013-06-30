# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PressPosts" do
    describe "Admin" do
      describe "press_posts" do
        login_refinery_user

        describe "press_posts list" do
          before do
            FactoryGirl.create(:press_post, :name => "UniqueTitleOne")
            FactoryGirl.create(:press_post, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.press_posts_admin_press_posts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.press_posts_admin_press_posts_path

            click_link "Add New Press Post"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PressPosts::PressPost.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::PressPosts::PressPost.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:press_post, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.press_posts_admin_press_posts_path

              click_link "Add New Press Post"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PressPosts::PressPost.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:press_post, :name => "A name") }

          it "should succeed" do
            visit refinery.press_posts_admin_press_posts_path

            within ".actions" do
              click_link "Edit this press post"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:press_post, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.press_posts_admin_press_posts_path

            click_link "Remove this press post forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PressPosts::PressPost.count.should == 0
          end
        end

      end
    end
  end
end
