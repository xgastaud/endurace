class Forest::Customer
  include ForestLiana::Collection

  collection :Race
  action 'Publish all'
  action 'Unpublish all'
end
