class HighlightType < ApplicationRecord
  belongs_to :customer
  acts_as_list scope: :customer, top_of_list: 0, add_new_at: :top
  validates :name, presence: true, uniqueness: { scope: :customer_id }
  validates :color, inclusion: { in: %w[#red #blue #green #yellow #white #orange #purple #pink] }
end
