require 'spec_helper'

describe "GET /things" do
  it "should return status 200" do
    get '/things'
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
  end
end

describe "POST /things" do
  it "should return status 202" do
    data = {
      id: '1',
      thing: 'foo'
    }
    post '/things', data.to_json, "CONTENT_TYPE" => "application/json"
    expect(last_response.status).to eq 202
  end
end
