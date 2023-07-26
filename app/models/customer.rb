class Customer < ApplicationRecord
  has_many :highlight_types, -> { order(:position) }, dependent: :destroy

  def highlight_types_fingerprint
    highlight_types_values = highlight_types.map { |ht| [ht.id, ht.name, ht.position] }
    Digest::MD5.hexdigest(highlight_types_values.to_s)
  end
end
