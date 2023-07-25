class Customer < ApplicationRecord
  has_many :highlight_types, -> { order(:position) }, dependent: :destroy
end
