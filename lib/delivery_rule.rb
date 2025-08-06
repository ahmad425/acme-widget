class DeliveryRule
  attr_accessor :min_limit, :max_limit, :price

  @@delivery_rules = [] #class variable to store all delivery rules

  def initialize(min_limit, max_limit, price)
    @min_limit = min_limit
    @max_limit = max_limit
    @price = price

    @@delivery_rules << self
  end

  def applies_to?(amount)
    amount >= min_limit && amount < max_limit
  end

  def self.delivery_cost(amount)
    @@delivery_rules.find { |rule| rule.applies_to?(amount) }.price
  end
end
