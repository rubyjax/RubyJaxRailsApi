require 'rails_helper'

RSpec.describe "resetting password", type: :request do
  specify "POST /reset_password" do
    post "/reset_password"
    expect(response).to be_accepted
    json = JSON.load(response.body)
    expect(json).to eq "message" => "email sent"
  end
end
