class Gensym
  ALPHABET = ("A".."Z").to_a + ("a".."z").to_a
  PREFIX = "gensym_"
  SUFFIX_LENGTH = 30
  VERSION = "0.1.0"

  def initialize(callsite_binding, generator = nil)
    @callsite_binding = callsite_binding
    @symbol_generator = generator || new_symbol_generator
  end

  def generate
    symbol_generator.detect { |symbol| !bound?(symbol) }
  end

  private

  attr_reader :callsite_binding, :symbol_generator

  def bound?(symbol)
    callsite_binding.local_variable_defined?(symbol)
  end

  def new_symbol_generator
    Enumerator.new do |yielder|
      loop do
        yielder.yield(random_symbol)
      end
    end
  end

  def random_symbol
    (PREFIX + ALPHABET.sample(SUFFIX_LENGTH).join).to_sym
  end
end
