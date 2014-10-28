require "spec_helper"

describe "Roomorama API" do 
  let(:roomorama_api){ RoomoramaApi }
  it "returns staging url" do 
    expect( roomorama_api ).to be_kind_of( Module )
  end

end
