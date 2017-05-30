require "spec_helper"

describe Gensym do
  it "has a version number" do
    expect(Gensym::VERSION).not_to be nil
  end

  it "returns a long prefixed symbol if not passed a generator" do
    generated_symbol = Gensym.new(binding).generate

    expect(generated_symbol).to be_a(Symbol)
    expect(generated_symbol.to_s).to start_with(Gensym::PREFIX)
    expect(generated_symbol.to_s.size).to eq(Gensym::PREFIX.size + Gensym::SUFFIX_LENGTH)
  end

  it "returns the first generated symbol if it's unbound" do
    mock_generator = [:foo, :bar]

    expect(Gensym.new(binding, mock_generator).generate).to eq(:foo)
  end

  it "returns the next generated symbol if the first is bound" do
    foo = 5
    mock_generator = [:foo, :bar]

    expect(Gensym.new(binding, mock_generator).generate).to eq(:bar)
  end
end
