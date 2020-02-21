require 'rails_helper'

RSpec.feature "UsersLogin", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "Home page" do
    # visit login_path
  end
end
