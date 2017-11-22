require 'rails_helper'

describe Talk do
  let!(:talks)   { FactoryGirl.create_list(:talk, 3) }
  let(:talk_id) { talks.first.id }

  describe 'GET /talks' do
    before { get "/talks" }

    it "returns a valid json response" do
      expect(json).not_to be_empty
      expect(response.status).to eql(200)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe 'GET /talks/:id' do
    let(:talk) { talks.first }
    before { get "/talks/#{talk_id}" }

    it "returns a specific talk" do
      expect(json.size).to eq(7)
      expect(talk.title == json["title"])
    end
  end

  describe 'POST /talk' do
    let(:new_talk) do {
      title: "Rails API and React",
      category: "web development",
      description: "we are working on cool project for the RubyJax website",
      length_of_talk: 15
    } end

    it "creates a new talk submission" do
      post "/talks", params: new_talk

      expect(response.status).to eql(201)
      expect(json["title"]).to eq("Rails API and React")
    end
  end

  describe 'POST /talk' do 
    let(:new_talk) do {
      title: "Rails API and React",
      category: "web development",
      description: "we are working on cool project for the RubyJax website",
      length_of_talk: "cat"
    } end

    it "should fail because length not integer" do
      post "/talks", params: new_talk

      expect(response.body).to eq({"error":"failed to create: Length of talk is not a number"}.to_json)
      expect(response.status).to eql(422) 
    end
  end

  describe 'PUT /talks/:id' do
    let(:new_description) { "this is a new description" }

    before { put "/talks/#{talk_id}", params: new_description }

    it "returns a status code 204" do
      expect(response.status).to eql(204)
    end
  end

  describe 'DELETE /talks/:id' do
    before { delete "/talks/#{talk_id}" }

    it "returns a status code 204" do
      expect(response.status).to eql(204)
    end
  end
end
