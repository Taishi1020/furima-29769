require 'rails_helper'

RSpec.describe "Shippings", type: :request do

  describe "GET /address" do
    it "returns http success" do
      get "/shipping/address"
      expect(response).to have_http_status(:success)
    end
  end

end
