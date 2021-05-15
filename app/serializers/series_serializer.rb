class SeriesSerializer < BaseSerializer
  attributes :name, :release_date, :description
  set_type :series

  has_many :tags
end
