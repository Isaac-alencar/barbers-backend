# frozen_string_literal: true

require 'json'

# BarberShopsController
class BarberShopsController < ApplicationController
  def index
    render json: {
      data: BarberShops::List.new.perform
    }
  end

  def create
    new_barber_shop = BarberShops::Creator.new.perform(**create_params)

    render json: new_barber_shop
  end

  def show
    barber_shop = BarberShops::Loader.new.perform(**show_params)

    render json: barber_shop
  end

  private

  def create_params
    create_barber_params = params.permit(:name, :address).to_h

    JsonNormalizer.new.normalize(create_barber_params)
  end

  def show_params
    show_params = params.permit(:id).to_h

    JsonNormalizer.new.normalize(show_params)
  end
end
