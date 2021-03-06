require 'spec_helper'

describe UsersHelper do
  setup :activate_authlogic

  describe "#user_nav" do
    context "when not logged in" do
      before(:each) { helper.stub :current_user => nil }

      it "renders login link" do
        helper.user_nav.should match(login_path)
      end
    end

    context "when logged in as User" do
      before(:each) { helper.stub :current_user => User.make, :is_admin? => false }

      it "renders logout link" do
        helper.user_nav.should match(logout_path)
      end

      it "renders edit profile link" do
        helper.user_nav.should match(edit_profile_path)
      end

      it "renders balance link" do
        helper.user_nav.should match(balance_path)
      end
    end

    context "when logged in as Administrator" do
      before(:each) { helper.stub :current_user => Administrator.make, :is_admin? => true }

      it "renders tags link" do
        helper.user_nav.should match(admin_dish_tags_path)
      end

      it "renders users managment link" do
        helper.user_nav.should match(admin_users_path)
      end
    end
  end
end

