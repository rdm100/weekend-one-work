def pet_shop_name(pet_shop)
  return @pet_shop[:name]
end

def total_cash(pet_shop)
  return @pet_shop[:admin][:total_cash]
end

def add_cash(cash, amount)
  cash[:admin][:total_cash] += amount
  return cash
end

def remove_cash(cash, amount)
  cash[:admin][:total_cash] += amount
  return cash
end

def pets_sold(pets_sold)
  return pets_sold[:admin][:pets_sold]
end

def increase_pets_sold(pets_sold, amount)
  pets_sold[:admin][:pets_sold] += amount
  return pets_sold
end

def stock_count(stock_count)
	count = 0
	for pet in stock_count[:pets]
		count += 1
	end
	return count
end

def pets_by_breed(pet_shop, breed)
  # loop through the pet_shop array, checking each hash for the breed.
  pets =[]
  for pet in pet_shop[:pets]
    if breed == pet[:breed]
      pets.push(pet)
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if name == pet[:name]
     return pet
	end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name) 
	for pets in pet_shop[:pets]
    pets.delete_if{pets[:name] == name}
  end
end	
 
def add_pet_to_stock(pet_shop, new_pet) 
	return pet_shop[:pets].push(new_pet)
end	

def customer_pet_count(customers) 
	customers[:pets].count
end	

def add_pet_to_customer(customer, new_pet) 
	return customer[:pets].push(new_pet)
end	

def customer_can_afford_pet(customer, new_pet) 
	if customer[:cash] < new_pet[:price] 
		return false
	else
		return true
	end
end	

# def sell_pet_to_customer(pet_shop, pet, customer)
#       if pet
#       	if customer_can_afford_pet(customer, pet)
#       add_pet_to_customer(customer, pet)
#       remove_pet_by_name(pet_shop, pet)
#       increase_pets_sold(pet_shop, 1)
#       add_cash(pet_shop, pet[:price])
#   	end
#     end
# end

def sell_pet_to_customer(pet_shop, pet, customer)
    if pet && customer_can_afford_pet(customer, pet)
	      add_pet_to_customer(customer, pet)
	      remove_pet_by_name(pet_shop, pet)
	      increase_pets_sold(pet_shop, 1)
	      add_cash(pet_shop, pet[:price])
	end
end


