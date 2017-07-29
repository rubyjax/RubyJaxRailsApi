require 'rails_helper'

RSpec.describe "resetting password", type: :request do
  specify "POST /reset_password" do
    post "/reset_password"
    expect(response.status).to be 202
    json = JSON.load(response.body)
    expect(json).to eq "message" => "email sent"
  end
end
