#!/usr/bin/env ruby

registry_items = [
  {
    :title => "Beer",
    :description => "A stein of beer each at Oktoberfest",
    :quantity => 4,
    :cost => 30,
    :img => 'beer.jpg',
  },
  {
    :title => "Scenic Train Ride",
    :description => "Daytime train ride from Munich to Ljubljana through scenic Austria",
    :quantity => 1,
    :cost => 400,
    :img => 'train.jpg',
  },
]

registry_items.each do |registry_item|
  next if RegistryItem.find_by_title(registry_item[:title])
  RegistryItem.create!(:title => registry_item[:title], :description => registry_item[:description], :quantity => registry_item[:quantity], :cost => registry_item[:cost], :img => registry_item[:img])
end