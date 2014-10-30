require 'spec_helper'

describe "RoomoramaApi" do 
  describe "Config" do 
    let(:roomorama_config){ RoomoramaApi::Config.new }
    it "instanciate config object" do
      expect( roomorama_config ).to be_instance_of( RoomoramaApi::Config )
    end
 
    describe "object attributes" do 
      subject { RoomoramaApi::Config.new }
      it { is_expected.to respond_to(:client_id) }
      it { is_expected.to respond_to(:client_secret) }
      it { is_expected.to respond_to(:token) }
    end

    describe "#base_url" do
      it "responds with base_url" do
        expect( roomorama_config ).to respond_to(:base_url)
        expect( roomorama_config.base_url ).to eql( "api.staging.roomorama.com" )
      end
    end
  end
end
