# frozen_string_literal: true

# BarberShop
class BarberShop < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
end
