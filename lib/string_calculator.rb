module StringCalculator
  class << self
    def add(numbers)
      return 0 unless numbers.length > 0

      get_sum(split_numbers(numbers))
    end

    private

    def split_numbers(numbers)
      numbers.split(",").map(&:to_i)
    end

    def get_sum(numbers)
      numbers.inject(0, &:+)
    end
  end
end
