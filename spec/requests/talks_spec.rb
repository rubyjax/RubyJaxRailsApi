require 'rails_helper'

describe Talk do
  let!(:talk) { FactoryGirl.create(:talk) }
  let(:new_talk) do {
    title: "Rails API and React",
    category: "web development",
    description: "we are working on cool project for the RubyJax website"
  } end
  

  it "returns a valid json response" do
    get "/talks"
    expect(response.status).to eql(200)
    expect(response.content_type).to eq("application/json")
  end

  it "creates a new talk submission" do
    post "/talks", params: new_talk

    post_response = JSON.parse(response.body)

    expect(response.status).to eql(201)
    expect(post_response["title"]).to eq("Rails API and React")
  end
end
