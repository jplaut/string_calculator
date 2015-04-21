module StringCalculator
  class << self
    def add(input)
      return 0 unless input.length > 0

      numbers = split_numbers(remove_delimiter_definition(input), delimiter(input))
      get_sum(numbers)
    end

    private

    def delimiter(input)
      input =~ /\/\/(.)/ ? $1 : /[\n,]/
    end

    def remove_delimiter_definition(input)
      input =~ /(\/\/.\n)/ ? input.gsub($1, '') : input
    end

    def split_numbers(numbers, delimiter)
      numbers.split(delimiter).map(&:to_i)
    end

    def get_sum(numbers)
      numbers.inject(0, &:+)
    end
  end
end
