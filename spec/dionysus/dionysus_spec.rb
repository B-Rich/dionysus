require "spec_helper"

describe Dionysus::Bot do
  it "has a version number" do
    expect(Dionysus::Bot::VERSION).not_to be nil
  end
end
