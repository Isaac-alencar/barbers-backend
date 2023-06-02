# frozen_string_literal: true

# UseCases
module BarberShops
  # create a new barber_shops
  class Creator
    def perform(name: nil, address: nil)
      BarberShop.create!(name:, address:)
    end
  end
end
