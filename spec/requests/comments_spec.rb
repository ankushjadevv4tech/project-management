require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/comments/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/comments/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/comments/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/comments/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
