# frozen_string_literal: true

# UseCases
module BarberShops
  # Find All barber_shops
  class List
    def perform
      BarberShop.all.to_a
    end
  end
end
