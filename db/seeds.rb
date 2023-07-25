return if Customer.any?

oppy = Customer.create! name: 'J. Robert Oppenheimer'
oppy.highlight_types.create! name: 'Positive Reaction', color: '#green'
oppy.highlight_types.create! name: 'Insight', color: '#blue'
oppy.highlight_types.create! name: 'Action Item', color: '#white'

Customer.create! name: 'Werner Heisenberg'
