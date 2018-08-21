require_relative 'menu'
require_relative 'dish'

class Takeaway

attr_reader :basket, :menu 


  def initialize(menu) 
    @menu = menu
    @basket = []
  end

  def add(dish, amount = 1)
    fail "#{dish} is off the menu" unless on_menu?(dish)
    @basket.push({ dish: dish, amount: amount })      
  end

  def remove(dish)
    fail "#{dish} is not in your basket" unless basket.include?(dish)
    basket.delete(dish) # why is this not working? 
  end

  def list 
    empty_basket_error 
    @basket.each do |item|
      puts "#{item[:amount]} x #{item[:dish].name}"
    end
  end

  def total 
    empty_basket_error
    @basket.map { |item| item[:amount] * item[:dish].price }.reduce(:+)
  end



  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

  def empty_basket?
    @basket.empty?
  end

  def empty_basket_error
    raise 'Basket is empty' if empty_basket?
  end

end
