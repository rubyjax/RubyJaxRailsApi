require 'rails_helper'

describe TalksController do

  it "should post with valid parameters" do
    talk = Talk.new(title: "title", category: "category", description: "description", length_of_talk: 10)
    post :create, {params: talk.attributes}
    expect(Talk.last.title).to eq(talk.title)
  end

  it "should paginate" do
    9.times do
      Talk.create(title: "title", category: "category", description: "description")
    end
    get :index
    expect(assigns(:talks).size).to eq(5)
    get :index, {params: {page: 2}}
    expect(assigns(:talks).size).to eq(4)
  end

  it "should not post with invalid parameters" do
    title = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id lacus ac sem suscipit dapibus accumsan ac lorem"
    description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id lacus ac sem suscipit dapibus accumsan ac lorem. Curabitur sollicitudin auctor velit, quis ultrices mi ornare id. Aliquam ac scelerisque dolor. Nullam nec pharetra lectus. Sed porta dolor ac suscipit ultricies. Fusce vulputate libero ac suscipit varius. Vivamus lorem mauris, maximus sed cursus eget, posuere non arcu. Proin ultrices, mi sit amet luctus mollis, nulla dui maximus mi, vitae elementum dolor urna at mauris. Duis sed mattis nibh. Cras mattis volutpat dictum. Duis nisi nisi, semper eu sem et, vehicula commodo leo. Mauris vulputate ligula viverra, semper mi at, elementum leo. Aliquam finibus lorem quam, et accumsan tellus faucibus eu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi faucibus risus placerat, rutrum libero in, aliquam diam. Nam eu nisl non nisi mattis accumsan. Curabitur sodales tellus quam. Donec cursus imperdiet ipsum, ac egestas sem. Integer lacus quam, venenatis eu pulvinar ac, vestibulum consectetur neque. Mauris aliquam ultricies dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sed elit sed velit accumsan sodales et id purus. Proin sed quam a enim varius sodales. Maecenas vel lectus sem. Duis eu nulla faucibus, molestie justo vitae, laoreet nisi. Duis commodo eget odio."
    talk = Talk.new(title: title, category: "category", description: description, length_of_talk: 10)
    post :create, {params: talk.attributes}
    expect(assigns(:talk).errors.full_messages).to eq(["Title has too many words", "Description has too many words"])
  end

  it "should not post with invalid title" do
    title = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id lacus ac sem suscipit dapibus accumsan ac lorem"
    description = "this is a description"
    talk = Talk.new(title: title, category: "category", description: description, length_of_talk: 10)
    post :create, {params: talk.attributes}
    expect(assigns(:talk).errors.full_messages).to eq(["Title has too many words"])
  end

  it "should not post with invalid description" do
    title = "Morbi id lacus ac sem suscipit dapibus accumsan ac lorem"
    description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id lacus ac sem suscipit dapibus accumsan ac lorem. Curabitur sollicitudin auctor velit, quis ultrices mi ornare id. Aliquam ac scelerisque dolor. Nullam nec pharetra lectus. Sed porta dolor ac suscipit ultricies. Fusce vulputate libero ac suscipit varius. Vivamus lorem mauris, maximus sed cursus eget, posuere non arcu. Proin ultrices, mi sit amet luctus mollis, nulla dui maximus mi, vitae elementum dolor urna at mauris. Duis sed mattis nibh. Cras mattis volutpat dictum. Duis nisi nisi, semper eu sem et, vehicula commodo leo. Mauris vulputate ligula viverra, semper mi at, elementum leo. Aliquam finibus lorem quam, et accumsan tellus faucibus eu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi faucibus risus placerat, rutrum libero in, aliquam diam. Nam eu nisl non nisi mattis accumsan. Curabitur sodales tellus quam. Donec cursus imperdiet ipsum, ac egestas sem. Integer lacus quam, venenatis eu pulvinar ac, vestibulum consectetur neque. Mauris aliquam ultricies dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sed elit sed velit accumsan sodales et id purus. Proin sed quam a enim varius sodales. Maecenas vel lectus sem. Duis eu nulla faucibus, molestie justo vitae, laoreet nisi. Duis commodo eget odio."
    talk = Talk.new(title: title, category: "category", description: description, length_of_talk: 10)
    post :create, {params: talk.attributes}
    expect(assigns(:talk).errors.full_messages).to eq(["Description has too many words"])
  end
end
