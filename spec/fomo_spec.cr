require "./spec_helper"

describe Fomo do
  it "sets api_key" do
    Fomo.api_key = "test"
    Fomo.api_key.should eq("test")
  end

  it "gets client" do
    Fomo.client.class.name.should eq("HTTP::Client")
  end
end
