require 'minitest/autorun'

require_relative '../pizza'

class CACC < Minitest::Test
  def test_case_1
    ingredients = ["Tomato", "Cheese", "Ham", "Olives"]
    assert_equal "Neapolitan Classic", name_pizza(ingredients)
  end

  def test_case_2
    ingredients = ["Cheese", "Ham", "Olives"]
    assert_equal "Pizza From da house", name_pizza(ingredients)
  end

  def test_case_3
    ingredients = ["Ham", "Olives"]
    assert_equal "Pizza From da house Without Cheese", name_pizza(ingredients)
  end

  def test_case_4
    ingredients = ["Tomato", "Cheese", "Ham"]
    assert_equal "Neapolitan Classic", name_pizza(ingredients)

  end

  def test_case_5
    ingredients = ["Tomato", "Cheese"]
    assert_equal "Classic From da house", name_pizza(ingredients)
  end

  def test_case_6
    ingredients = ["Tomato", "Cheese", "Olives"]
    assert_equal "Neapolitan Classic", name_pizza(ingredients)
  end

  def test_case_7
    ingredients = ["Extra cheese"]
    assert_equal "Pizza From da house", name_pizza(ingredients)
  end

  def test_case_8
    ingredients = []
    assert_equal "Pizza From da house Without Cheese", name_pizza(ingredients)
  end
end