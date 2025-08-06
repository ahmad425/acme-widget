require_relative 'lib/product'
require_relative 'lib/delivery_rule'
require_relative 'lib/offer'
require_relative 'lib/basket'
require_relative 'constants'

# Initialize delivery rules
DELIVERY_RULES.map { |r| DeliveryRule.new(r[:min], r[:max], r[:price]) }

# Initialize offers
OFFERS.map { |o| Offer.new(o[:product_code], o[:buy_count], o[:get_count], o[:discount]) }

# Initialize Catalogue
r01 = Product.new(*(PRODUCTS.find { |p| p[:code] == 'R01' }.values))
g01 = Product.new(*(PRODUCTS.find { |p| p[:code] == 'G01' }.values))
b01 = Product.new(*(PRODUCTS.find { |p| p[:code] == 'B01' }.values))

basket = Basket.new
puts 'Scenario 1: When no product in basket'
puts "Total: #{basket.total}"

puts "==========="

puts 'Scenario 2: Add B01 and G01 products'
basket.add_product(b01)
basket.add_product(g01)

puts "Total: #{basket.total}"
basket.clear!

puts "==========="

puts 'Scenario 3: Add two R01 products'
basket.add_product(r01)
basket.add_product(r01)

puts "Total: #{basket.total}"
basket.clear!

puts "==========="

puts 'Scenario 4: Add R01 and G01 products'
basket.add_product(r01)
basket.add_product(g01)

puts "Total: #{basket.total}"
basket.clear!

puts "==========="

puts 'Scenario 5: Add 2 B01 and 3 R01 products'
basket.add_product(b01)
basket.add_product(b01)
basket.add_product(r01)
basket.add_product(r01)
basket.add_product(r01)

puts "Total: #{basket.total}"
basket.clear!
