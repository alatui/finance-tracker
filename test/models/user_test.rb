require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:USER_01)
  end

  test 'under stock limit' do
    #('A'..'Z').each do |n|
    #  stock = stocks("STOCK_#{n*4}")
    #  puts stock.inspect
    #end
    Stock.limit(9).map {|stock| UserStock.create(user: @user, stock: stock) }
    assert @user.under_stock_limit?
  end

  test 'above stock limit' do
    Stock.limit(10).map {|stock| UserStock.create(user: @user, stock: stock) }
    assert_not @user.under_stock_limit?
  end

  test 'stock already added' do
    stock = stocks(:AAAA)
    UserStock.create(user: @user, stock: stock)
    assert @user.stock_already_added?(stock.ticker)
  end

end
