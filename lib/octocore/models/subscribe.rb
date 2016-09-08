require 'massive_record'

# Model for Subscribe to us (in the footer), on the microsite
module Octo

  class Subscriber < MassiveRecord::ORM::Table

    field :created_at, :time
    field :email

  end
end
