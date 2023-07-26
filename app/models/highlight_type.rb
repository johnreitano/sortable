class HighlightType < ApplicationRecord
  belongs_to :customer
  acts_as_list scope: :customer, top_of_list: 0, add_new_at: :top
  validates :name, presence: true, uniqueness: {scope: :customer_id}
  validates :color, inclusion: {in: %w[#red #blue #green #yellow #white #orange #purple #pink]}

  def move(new_position, highlight_types_fingerprint)
    Rails.logger.info("highlight_types_fingerprint=#{highlight_types_fingerprint}")
    customer.with_lock do
      expected_fingerprint = customer.reload.highlight_types_fingerprint
      if highlight_types_fingerprint != expected_fingerprint
        errors.add(:highlight_types_fingerprint, "value #{highlight_types_fingerprint} does not match expected value #{expected_fingerprint}")
        return false
      end
      update!(position: new_position)
    end
  rescue ActiveRecord::StaleObjectError
    Rails.logger.warn("StaleObjectError in HighlightType#change_position")
    errors.add(:customer, "cannot be locked")
    false
  end
end
