require 'rails_helper'

RSpec.describe "resetting password", type: :request do
  specify "POST /reset_password" do
    expect(PasswordResetMailer).to receive(:reset_password).and_call_original
    post "/reset_password"
    expect(response).to be_accepted
    json = JSON.load(response.body)
    expect(json).to eq "message" => "email sent"
    expect(ActionMailer::Base.deliveries).not_to(be_empty)
  end
end
