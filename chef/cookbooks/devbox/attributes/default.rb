if ['logician-dell', 'elsie' ].include? node['hostname']
  node.override['scale_factor'] = 1.4
end
