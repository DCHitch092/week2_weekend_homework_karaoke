class Venue

  attr_reader :name, :till, :rooms, :stock

  def initialize(name, till, rooms, stock)
    @name = name
    @till = till
    @rooms = rooms
    @stock = stock
  end

  def create_room (name, price, space)
    new_room = Room.new(name, price, space)
    @rooms.push(new_room)
  end

  def check_in_guest(guest, room)
    # current_booking = room.guests
    # current_booking.push(guest)

      #check if customer has enough money
      return "insufficient funds" if room.check_funds?(guest) == false
      #check if full
      return "there is no room" if room.check_space?() == false
      #takes payment for the room
      take_payment(guest,room)
      room.add_guest(guest)
  end

  def check_out_guest(guest, room)
    room.remove_guest(guest)
  end

  def add_funds(amount)
    @till += amount
  end

  def take_payment(guest, room)
    amount = room.price
    # guest.remove_funds
    guest.make_payment(amount)
    add_funds(amount)
  end

  # def identify_drink_in_stock(drink_name)
  #   found_drink =  nil
  #   for drink in @stock
  #     found_drink = drink if drink[:name] == drink_name
  #   end
  #   # return found_drink
  #   return @stock.index(found_drink)
  #
  # end

  def find_drink_by_name(drink_name)
    found_drink = nil
    for drink in @stock
      found_drink = drink if drink.name == drink_name
    end
    return found_drink
    # @stock.find{|drink| drink == drink_name}
  end

  def sell_drink(drink_name, guest)
    found_drink = find_drink_by_name(drink_name)
    amount = found_drink.price
    guest.make_payment(amount)
    found_drink.remove_unit
    add_funds(amount)

  end

end
