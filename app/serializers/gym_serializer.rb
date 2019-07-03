class GymSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address_1, :address_2, :city, :state, :guests, :price, :owner_id, :filename
  has_many :reservations
end
