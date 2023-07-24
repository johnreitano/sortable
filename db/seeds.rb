Customer.destroy_all

o = Customer.create! name: 'Oppenheimer'
h = Customer.create! name: 'Heisenberg'

o.highlights.create! name: 'Positive Reaction', color: '#green'
o.highlights.create! name: 'Insight', color: '#blue'
o.highlights.create! name: 'Action Item', color: '#white'

