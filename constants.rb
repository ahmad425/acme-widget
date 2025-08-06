PRODUCTS = [
  { name: 'Red Widget', code: 'R01', price: 32.95 },
  { name: 'Green Widget', code: 'G01', price: 24.95 },
  { name: 'Blue Widget', code: 'B01', price: 7.95 }
]

DELIVERY_RULES = [
  { min: 0, max: 50, price: 4.95 },
  { min: 50, max: 90, price: 2.95 },
  { min: 90, max: Float::INFINITY, price: 0 }
]

OFFERS = [
  { product_code: 'R01', buy_count: 2, get_count: 1, discount: 50 }
]