class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :guests, :user_id, :gym_id
  belongs_to :user, serializer: UserSerializer
  belongs_to :gym, serializer: GymSerializer
  has_many :users, serializer: UserSerializer
end
