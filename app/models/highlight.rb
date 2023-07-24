class Highlight < ApplicationRecord
  belongs_to :customer
  acts_as_list scope: :customer, add_new_at: :top, top_of_list: 0
  validates :name, presence: true, uniqueness: { scope: :customer_id }
  validates :color, inclusion: { in: %w[#red #blue #green #yellow #white #orange #purple #pink] }
end
