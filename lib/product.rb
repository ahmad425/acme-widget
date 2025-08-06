class Product
  attr_reader :name, :code, :price
  attr_accessor :id

  @@products = [] #class variable to store all products

  def initialize(name, code, price)
    @name = name
    @code = code
    @price = price

    valid?

    @@products << self
  end
  
  def available?
    product = @@products.find { |p| p.code == code }
    raise "Product not found: #{product_code}" unless product
    product
  end

  private

  def valid?
    raise "Please provide name!" if name.nil?
    raise "Please provide code!" if code.nil?
    raise "Please provide price!" if price.nil?
    raise "Product already exists" if @@products.find { |p| p.code == code }
    true
  end
end
