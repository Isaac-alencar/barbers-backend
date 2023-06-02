# frozen_string_literal: true

# UseCases
module BarberShops
  # Find All barber_shops
  class Loader
    def perform(id: nil)
      BarberShop.find(id)
    end
  end
end
