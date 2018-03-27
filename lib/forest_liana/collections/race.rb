class Forest::Customer
  include ForestLiana::Collection

  collection :Race
  action 'Publish all'
end
