module StringCalculator
  class << self
    def add(input)
      return 0 unless input.length > 0

      numbers = split_numbers(extract_numbers(input), delimiter(input))
      get_sum(numbers)
    end

    private

    def delimiter(input)
      input =~ /\/\/(.)/ ? $1 : /[\n,]/
    end

    def extract_numbers(input)
      input =~ /(\/\/.\n)/ ? input.gsub($1, '') : input
    end

    def split_numbers(numbers, delimiter)
      numbers.split(delimiter).map(&:to_i)
    end

    def get_sum(numbers)
      check_for_negatives(numbers)
      numbers.inject(0, &:+)
    end

    def check_for_negatives(numbers)
      negatives = numbers.select { |num| num < 0 }
      raise "negatives not allowed: #{negatives.join(", ")}" if negatives.length > 0
    end
  end
end
