class Series < ApplicationRecord
  has_many :tags

  accepts_nested_attributes_for :tags, allow_destroy: true,
                                       reject_if: proc { |attr| attr['name'].nil? }
end
