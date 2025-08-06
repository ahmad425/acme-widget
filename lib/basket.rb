require_relative 'offer'

class Basket
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product)
    return unless product.available?
    
    product.id = @items.length
    @items << product 
  end

  def remove_product(product)
    @items.select! { |p| p.id != product.id } if product.available?
  end

  def clear!
    @items = []
  end

  def total
    return 0 if @items.empty?

    subtotal = @items.sum(&:price)
    subtotal -= calculate_discount
    delivery_cost = DeliveryRule.delivery_cost(subtotal)

    (subtotal + delivery_cost).round(2)
  end

  private

  def calculate_discount
    discount = 0
    @items.uniq.each do |product|
      products_count = @items.select { |p| p.code == product.code }.size
      offer = Offer.all.find { |o| o.applies_to?(product, products_count) }
      if offer
        discount += (product.price * (products_count / offer.buy_count) * offer.get_count * (offer.discount.to_f / 100))
      end
    end
    discount
  end
end