require 'rails_helper'

'''# RSpec.describe "Students", type: :request do
  # describe "GET /students" do
    # it "works! (now write some real specs)" do
      # get students_path
      # expect(response).to have_http_status(200)
    # end
  # end
# end'''

RSpec.describe "Students", type: :request do
  describe "GET /students" do
    it "returns a successful response" do
      get students_path
      expect(response).to have_http_status(:ok)
    end
  end
 end
 