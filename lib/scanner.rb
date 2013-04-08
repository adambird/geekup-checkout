Discount = Struct.new(:number, :discount)

class Scanner
  
  def prices
    {
      apples: 100,
      cherries: 75,
      bananas: 150
    }
  end

  def discounts
    {
      cherries: Discount.new(2, 20),
      bananas: Discount.new(2, 150),
      pommes: Discount.new(3, 100),
      mele: Discount.new(2, 50)
    }
  end

  def global_discounts
    {
      apples: Discount.new(4, 100)
    }
  end

  def items
    @items ||= []
  end

  def scan(item)
    item.split(",").collect { |i| i.strip.downcase.to_sym }.each do |i|
      items << i
    end
    price = items.inject(0) { |sum, item| sum += prices[translate(item)] }

    discounts.keys.each do |key| 
      count = items.select { |item| item == key }.count
      price -= discounts[key].discount if discounts[key].number <= count
    end

    global_discounts.keys.each do |key|
      count = items.select { |item| translate(item) == key }.count
      price -= global_discounts[key].discount if global_discounts[key].number <= count
    end

    price -= 200 if items.count >= 5

    price
  end 

  def translate(source)
    resources = { :pommes => :apples, :mele => :apples }

    resources[source] || source
  end
end