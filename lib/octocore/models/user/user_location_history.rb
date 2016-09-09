require 'massive_record'

module Octo
  class UserLocationHistory < MassiveRecord::ORM::Table

    belongs_to :user, class_name: 'Octo::User'

    field :created_at, :time

    field :latitude, :integer
    field :longitude, :integer
  end
end
