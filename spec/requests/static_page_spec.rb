require 'rails_helper'

RSpec.describe "Static_page", type: :request do
  it "rootにアクセスできること" do
    # ログインページにアクセスします
    get root_path
    expect(response.status).to eq 200
  end
  # it "helpにアクセスできること" do
  #   # ログインページにアクセスします
  #   get help_path
  #   expect(response.status).to eq 200
  # end
  # it "aboutにアクセスできること" do
  #   # ログインページにアクセスします
  #   get about_path
  #   expect(response.status).to eq 200
  # end
end
