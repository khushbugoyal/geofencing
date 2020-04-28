# frozen_string_literal: true

module TourAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :name
        field :created_at
        field :updated_at
      end

      create do
        field :name
        field :polygon_coordinates, :pg_hash_array
        field :locations
      end

      edit do
        field :name
        field :polygon_coordinates, :pg_hash_array
        field :locations
      end

      show do
        field :name
        field :polygon_coordinates, :pg_hash_array
        field :locations
      end
    end
  end
end
