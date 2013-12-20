shared_examples "a correct configuration" do
  it "has the correct information" do
    expect(env_config).to(eq(expected_env_config))
  end
end
