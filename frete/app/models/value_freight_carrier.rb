class ValueFreightCarrier < ActiveRecord::Base
  attr_accessible :id_carrier, :id_origin_city, :id_destination_city, :beginning_band, :end_band, :value
  validates :id_carrier, :id_origin_city, :id_destination_city, :beginning_band, :end_band, :value, :presence => true

  class << self
    def search(origin_city, detination_city, weight)
      tracks = scoped

      case
      when player.present? && name.blank?
        tracks = tracks.search_by_player(player)
      when name.present? && player.blank?
        tracks = tracks.search_by_name(name)
      when player.present? && name.present?
        tracks = tracks.search_all(player, name)
      end

      return tracks
    end
  end
end
