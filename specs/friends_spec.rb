require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Shaggy",
      age: 12,
      monies: 1,
      friends: ["Velma","Fred","Daphne", "Scooby"],
      favourites: {
        tv_show: "Friends",
        snacks: ["charcuterie"]
      }
    }

    @person2 = {
      name: "Velma",
      age: 15,
      monies: 2,
      friends: ["Fred"],
      favourites: {
        tv_show: "Baywatch",
        snacks: ["soup","bread"]
      }
    }

    @person3 = {
      name: "Scooby",
      age: 18,
      monies: 20,
      friends: ["Shaggy", "Velma"],
      favourites: {
        tv_show: "Pokemon",
        snacks: ["Scooby snacks"]
      }
    }

    @person4 = {
      name: "Fred",
      age: 18,
      monies: 20,
      friends: ["Shaggy", "Velma", "Daphne"],
      favourites: {
        tv_show: "X-Files",
        snacks: ["spaghetti", "ratatouille"]
      }
    }

    @person5 = {
      name: "Daphne",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "X-Files",
        snacks: ["spinach"]
      }
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  # 1. For a given person, return their name
  def test_getting_name
    result = get_name(@person5)
    assert_equal("Daphne", result)
  end

  # 2. For a given person, return their favourite tv show
  # (e.g. the function favourite_tv_show(@person2) should return the string "Baywatch")
  def test_getting_tvshow
    result = get_tvshow(@person2)
    assert_equal("Baywatch", result)
  end

  # 3. For a given person, check if they like a particular food
  # (e.g. the function likes_to_eat(@person2, "bread") should return true, likes_to_eat(@person3, "spinach") should return false)
  def test_check_food_like
    result = check_food_like(@person4, "spaghetti")
    assert_equal("Yum", result)
  end

  def test_check_food_not_like
    result = check_food_like(@person4, "Scooby snacks")
    assert_equal("bleaugh", result)
  end

  # 4. For a given person, add a new name to their list of friends
  # (e.g. the function add_friend(@person2, "Scrappy-Doo") should add Scrappy-Doo to the friends.)
  # (hint: This function should not return anything. After the function call, check for the length of the friends array to test it!)

  def test_check_friend_add
    result = friend_add(@person2, "John")
    assert_equal(2, result)
  end

  # 5. For a given person, remove a specific name from their list of friends
  # (hint: Same as above, testing for the length of the array should be sufficient)

  def test_check_friend_remove
    result = friend_remove(@person1, "Velma")
    assert_equal(3, result)
  end


  # 6. Find the total of everyone's money
  # (hint: use the @people array, remember how we checked the total number of eggs yesterday?)
  def test_monies_total
    result = monies_total(@people)
    assert_equal(143, result)
  end

  # 7. For two given people, allow the first person to loan a given value of money to the other
  # (hint: our function will probably need 3 arguments passed to it... the lender, the lendee, and the amount for this function)
  # (hint2: You should test if both the lender's and the lendee's money have changed, maybe two assertions?)

  def test_monies_loan
    result = monies_loan(@person5, @person1, 90)
    assert_equal("Shaggy now has 91 monies. Daphne has 10", result)
  end

  # 8. Find the set of everyone's favourite food joined together
  # (hint: concatenate the favourites/snack arrays together)
  def test_food_all
    result = food_all(@people)
    assert_equal(["charcuterie", "soup","bread","Scooby snacks","spaghetti", "ratatouille","spinach"], result)
  end

  # 9. Find people with no friends
  # (hint: return an array, there might be more people in the future with no friends!)
  def test_friends_none
    result = friends_none(@people)
    assert_equal(["Daphne"], result)
  end

end
