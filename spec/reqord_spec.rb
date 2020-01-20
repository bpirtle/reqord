RSpec.describe Reqord do
  it "has a version number" do
    expect(Reqord::VERSION).not_to be nil
  end

  it "insert middleware" do
    expect(Reqord::Middleware.insert_middleware).to eq(true)
  end
end
