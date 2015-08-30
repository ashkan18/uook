require 'spec_helper'
require 'rails_helper'


RSpec.describe Uook::API do
  include Rack::Test::Methods

  def app
    Uook::API
  end

  describe Uook::API do
    describe "GET /api/books" do
      it "returns an empty array of statuses" do
        get "/api/books"
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq []
      end
    end
  end
end