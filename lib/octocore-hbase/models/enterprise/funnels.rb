require 'massive_record'
require 'octocore-hbase/record'
require 'set'

module Octo

  # Stores the funnel for the enterprise
  class Funnel < MassiveRecord::ORM::Table

    Octo.featureflag self, true

    include Octo::Record

    #belongs_to :enterprise, class_name: 'Octo::Enterprise'
    column_family :info do

      field :name_slug
      field :funnel, :array

      field :name
      field :active, :boolean

      timestamps
    end

    attr_accessible :name_slug, :funnel, :name, :active


    # Generates a new funnel from the pages provided
    # @param [Array] pages The pages array. This array could contain instances
    #   of either String, Octo::Product or Octo::Page.
    #   If string, it will be assumed that these are routeurls for pages or
    #   products.
    #   If the class is explicitly specified, it will be used.
    # @param [Hash] opts The options for creating funnel
    # @option opts [String] :name The name of the funnel
    # @option opts [String] :enterprise_id The enterprise ID for whom funnel is
    #   being created
    # @return [Octo::Funnel] The funnel created
    def self.from_pages(pages, opts = {})
      funnel_length = pages.count
      return nil if funnel_length.zero?

      funnel = Array.new
      enterprise_id = opts.fetch(:enterprise_id, nil)

      # Check if they are Octo::Product or Octo::Page instantces and handle
      if ::Set.new([Octo::Product, Octo::Page]).include?(pages[0].class)
        funnel = pages.collect { |p| p.routeurl }
        enterprise_id = pages[0].enterprise_id
      elsif pages[0].class == String
        funnel = pages
      end

      # Create a new funnel
      self.new(
        enterprise_id: enterprise_id,
        name: opts.fetch(:name),
        funnel: funnel
      ).save!
    end

    # Returns data for a funnel
    # @return [Octo::FunnelData] The Octo funnel data
    def data(ts = Time.now.floor)
      args = {
        enterprise_id: self.enterprise.id,
        funnel_slug: self.name_slug,
        ts: ts
      }
      res = Octo::FunnelData.where(args)
      if res.count > 0
        res.first
      elsif self.enterprise.fakedata?
        args.merge!({ value: fake_data(self.funnel.count) })
        Octo::FunnelData.new(args).save!
      end
    end

    private

    # Generates fake data for funnel
    # @param [Fixnum] n The length of funnel
    # @return [Array] An array containing the funnel value
    def fake_data(n)
      fun = Array.new(n)
      max_dropoff = 100/n
      n.times do |i|
        if i == 0
          fun[i] = 100.0
        else
          fun[i] = fun[i-1] - rand(1..max_dropoff)
          if fun[i] < 0
            fun[i] = rand(0...fun[i].abs)
          end
        end
      end
      fun
    end

  end
end

