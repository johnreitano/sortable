class Customer < ApplicationRecord
  has_many :highlights, -> { order(:position) }, dependent: :destroy
end
