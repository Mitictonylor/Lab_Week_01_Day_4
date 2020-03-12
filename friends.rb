def get_name(person)
  return person[:name]
end

def get_tvshow(person)
  return person[:favourites][:tv_show]
end

def check_food_like(person, food)
  for snack in person[:favourites][:snacks]
    if food == snack
      return "Yum"
    else
      return "bleaugh"
    end
  end
end


def friend_add(person, new_friend)
  person[:friends].push(new_friend)

  return person[:friends].length
end


def friend_remove(person, prick)
  person[:friends].delete(prick)
  return person[:friends].length
end


def monies_total(people)
  total_money = 0
  for person in people
    total_money += person[:monies]
  end
  return total_money
end


def monies_loan(loaner, loanee, money_lend)
  loaner[:monies] -= money_lend
  loanee[:monies] += money_lend
  return "#{loanee[:name]} now has #{loanee[:monies]} monies. #{loaner[:name]} has #{loaner[:monies]}"
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
