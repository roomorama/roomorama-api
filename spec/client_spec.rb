require "spec_helper"

describe "Roomorama API" do

  describe "Client" do
    let(:roomorama_client){ RoomoramaApi::Client.setup { |config| config.base_url = "https://api.staging.roomorama.com" } }
    it "implement client" do
      expect( roomorama_client ).to be_instance_of( RoomoramaApi::Client )
    end

    describe "Class methods" do
      subject { RoomoramaApi::Client }
      it { is_expected.to respond_to(:configuration) }
      it { is_expected.to respond_to(:setup) }
    end

    describe "Public interface" do
      subject { RoomoramaApi::Client.new }
      it { is_expected.to respond_to(:create_property) }
      it { is_expected.to respond_to(:update_property) }
      it { is_expected.to respond_to(:get_properties) }
      it { is_expected.to respond_to(:get_property) }
      it { is_expected.to respond_to(:set_instantly_available) }
      it { is_expected.to respond_to(:get_availabilities) }
      it { is_expected.to respond_to(:update_availabilities) }
      it { is_expected.to respond_to(:get_images) }
      it { is_expected.to respond_to(:get_image) }
      it { is_expected.to respond_to(:create_image) }
      it { is_expected.to respond_to(:update_image) }
      it { is_expected.to respond_to(:reorder_images) }
      it { is_expected.to respond_to(:host_property_url) }
      it { is_expected.to respond_to(:host_properties_url) }
      it { is_expected.to respond_to(:host_availabilities_url) }
      it { is_expected.to respond_to(:host_image_url) }
      it { is_expected.to respond_to(:host_images_url) }
    end

    describe ".configuration" do
      subject { RoomoramaApi::Client }
      it { is_expected.to respond_to(:configuration) }
    end

    describe ".setup" do
      let(:client_klass){ RoomoramaApi::Client }
      it "alias to configuration method" do
        expect( client_klass ).to respond_to(:configuration)
        expect( client_klass.method(:setup).original_name ).to eql(:configuration)
      end

      let(:client) do
        client_klass.setup do |conf|
          conf.token = "token"
          conf.client_id = 7
          conf.client_secret = "secret"
        end
      end

      it "propertly setting up an Client object" do
        expect(client).to be_instance_of( client_klass )
        expect(client.config.token).to eql( "token" )
        expect(client.config.client_id).to eql( 7 )
        expect(client.config.client_secret).to eql( "secret" )
      end
    end

    describe "#auth_token" do
      let(:roomorama_client){ RoomoramaApi::Client.setup{|c| c.token = "fake_token_#313" }  }

      it "is a private method" do
        expect( roomorama_client ).to_not respond_to(:auth_token)
      end

      it "return OAuth::Token class" do
        expect( roomorama_client.send(:auth_token) ).to be_instance_of( OAuth2::AccessToken )
      end

      it "assign access_token with value of token passed to the constructor" do
        expect( roomorama_client.send(:auth_token).token ).to eql( "fake_token_#313" )
      end
    end

    it "builds host_properties_url" do
      expect( roomorama_client.send(:host_properties_url) ).to eql("https://api.staging.roomorama.com/v1.0/host/rooms.json")
    end

    it "builds host_property_url" do
      expect( roomorama_client.send(:host_property_url, {id: 1}) ).to eql("https://api.staging.roomorama.com/v1.0/host/rooms/1.json")
    end

    it "builds host_availabilities_url" do
      expect( roomorama_client.send(:host_availabilities_url, {room_id: 1}) ).to eql("https://api.staging.roomorama.com/v1.0/host/rooms/1/availabilities.json")
    end

    it "builds host_images_url" do
      expect( roomorama_client.send(:host_images_url, {room_id: 1}) ).to eql("https://api.staging.roomorama.com/v1.0/host/rooms/1/images.json")
    end

    it "builds host_image_url" do
      expect( roomorama_client.send(:host_image_url, {room_id: 1, id: 1}) ).to eql("https://api.staging.roomorama.com/v1.0/host/rooms/1/images/1.json")
    end

    it "builds host_instantly_available" do
      expect( roomorama_client.send(:host_instantly_available_url, {room_id: 1, api_version: "v2.0"})).to eql("https://api.staging.roomorama.com/v2.0/host/rooms/1/instant.json")
    end

    describe "#prepare_response" do
      let(:response) { double("response") }

      it "is a private method" do
        expect(roomorama_client).to_not respond_to(:prepare_response)
      end

      it "raises UnauthorizedRequest for a 401 response" do
        allow(response).to receive(:status).and_return(401)
        expect { roomorama_client.send(:prepare_response, response) }.to raise_error(RoomoramaApi::UnauthorizedRequest)
      end

      it "raises InvalidRequest for a 422 response" do
        response.stub_chain(:response, :body).and_return("{}")
        allow(response).to receive(:status).and_return(422)
        expect { roomorama_client.send(:prepare_response, response) }.to raise_error(RoomoramaApi::InvalidRequest)
      end

      it "raises ApiNotResponding for a 5XX response" do
        allow(response).to receive(:status).and_return(500)
        expect { roomorama_client.send(:prepare_response, response) }.to raise_error(RoomoramaApi::ApiNotResponding)
      end

      it "raises UnexpectedResponse for not handled error" do
        allow(response).to receive(:status).and_return(301)
        expect { roomorama_client.send(:prepare_response, response) }.to raise_error(RoomoramaApi::UnexpectedResponse)
      end
    end

  end

end
