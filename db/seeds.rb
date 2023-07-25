Customer.destroy_all

o = Customer.create! name: 'J. Robert Oppenheimer'
h = Customer.create! name: 'Werner Heisenberg'

o.highlight_types.create! name: 'Positive Reaction', color: '#green'
o.highlight_types.create! name: 'Insight', color: '#blue'
o.highlight_types.create! name: 'Action Item', color: '#white'

