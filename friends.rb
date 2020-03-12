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
