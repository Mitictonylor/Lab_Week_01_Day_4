def get_name(person)
  return person[:name]
end

def get_tvshow(person)
  return person[:favourites][:tv_show]
  #or retunr personal.dig(:favourites,:tv_show)
end

def check_food_like(person, food)
  for snack in person[:favourites][:snacks]
    if food == snack
      return true
    else
      return false
    end
  end
end
#or def check_food_like(person, food)
# person[:favourite][:snacks].include?(food)
# end


def friend_add(person, new_friend)
  person[:friends].push(new_friend)
  return person[:friends].length
end

def friend_add_2(person, new_friend)
  person[:friends].push(new_friend)
end

def friend_remove_2(person, prick)
  person[:friends].delete(prick)
end

def friend_remove(person, prick)
  person[:friends].delete(prick)
  return person[:friends].length
    #without return
end


def monies_total(people)
  total_money = 0
  for person in people
    total_money += person[:monies]
  end
  return total_money
end

def test_lend_money
  # @person 2 has £2, @person1 has 1
  # @person2 lends £2 to @person1
  lend_money(@person2, @person1, 2)
  # assert that @person2 has 0 left
  assert_equal(0, @person2[:monies])
  # assert that @person1 now has £3
  assert_equal(3, @person1[:monies])
end

def monies_loan(loaner, loanee, money_lend)
  loaner_money_start = loaner[:monies]
  loanee_money_start = loanee[:monies]

  loaner[:monies] -= money_lend
  loanee[:monies] += money_lend

  if loanee_money_start != loanee[:monies] && loaner_money_start != loaner[:monies]
    return "Successful transaction of #{money_lend}"
  else
    return "unsuccessful"
  end

  #original return. return "#{loanee[:name]} now has #{loanee[:monies]} monies. #{loaner[:name]} has #{loaner[:monies]}"
end

def food_all(people)
  food_all_array = []
  for person in people
    food_all_array.concat(person[:favourites][:snacks])
  end
  return food_all_array

end

def friends_none(people)
  friends_none_list = []
  for person in people
    if person[:friends].length == 0
      friends_none_list.push(person[:name])
    end
  end
  return friends_none_list
end

def find_no_friends(people)
  no_mates = []
  for person in people
    if person[:friends].length == 0
      no_mates.push(person)
    end
  end
  return no_mates
end
