require 'massive_record'

module Octo
  class AppLogin < MassiveRecord::ORM::Table
    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    field :created_at, :time
    field :userid, :integer
  end
end
