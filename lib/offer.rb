class Offer
  attr_accessor :product_code, :buy_count, :get_count, :discount

  @@offers = []

  def initialize(product_code, buy_count, get_count, discount)
    @product_code = product_code
    @buy_count = buy_count
    @get_count = get_count
    @discount = discount

    @@offers << self
  end

  def self.all
    @@offers
  end

  def applies_to?(product, count)
    product.code == product_code && count >= buy_count
  end
end