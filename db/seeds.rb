c = Customer.last
c.highlight_types.create! name: "Positive Reaction", color: "#green"
c.highlight_types.create! name: "Insight", color: "#blue"
c.highlight_types.create! name: "Action Item", color: "#white"

# return if Customer.any?

# c = Customer.create! name: "J. Robert Oppenheimer"
# c.highlight_types.create! name: "Positive Reaction", color: "#green"
# c.highlight_types.create! name: "Insight", color: "#blue"
# c.highlight_types.create! name: "Action Item", color: "#white"

# c = Customer.create! name: "Werner Heisenberg"
# c.highlight_types.create! name: "Positive Reaction", color: "#green"
# c.highlight_types.create! name: "Insight", color: "#blue"
# c.highlight_types.create! name: "Action Item", color: "#white"
