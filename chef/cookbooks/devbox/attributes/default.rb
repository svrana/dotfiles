if ['logician-dell', 'elsie' ].include? node['hostname']
  node.override['scale_factor'] = 1.7
end
