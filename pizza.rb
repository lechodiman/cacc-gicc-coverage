def name_pizza(ingredients)
  if ingredients.include?('Tomato') && ingredients.include?('Cheese')
    name = 'Classic'
  else
    name = 'Pizza'
  end
  
  if ingredients.include?('Tomato') && ingredients.include?('Cheese') && (ingredients.include?('Ham') || ingredients.include?('Olives'))
    name = 'Neapolitan ' + name
  else
    name += ' From da house'
  end
  
  if !(ingredients.include?('Cheese') || ingredients.include?('Extra cheese'))
    name += ' Without Cheese'
  end
  
  return name
end