require 'rails_helper'

describe TimelineController do
  describe 'GET #index' do
    it "gets a response from an instagram api" do
      get :index
      expect(:medias.size).to be_between(2, 100)
    end
  end
end
