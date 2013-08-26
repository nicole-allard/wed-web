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
	:title => "Oktoberfest Food",
	:description => "Sausages, Pretzels, and Spätzle, oh my!",
	:quantity => 4,
	:cost => 80,
	:img => "oktoberfest.jpg",
  },
  {
	:title => "Dinner in Hallstatt",
	:description => "Romantic dinner on the lake in beautiful Hallstatt, Austria",
	:quantity => 1,
	:cost => 150,
	:img => "hallstat.jpg",
  },
  {
    :title => "Scenic Train Ride",
    :description => "Upgrade us to first class on our daytime train ride from Munich to Ljubljana through scenic Austria",
    :quantity => 1,
    :cost => 200,
    :img => 'train.jpg',
  },
  {
	:title => "Dinner in Ljubljana",
	:description => "Dinner by the river in Ljubljana, Solvenia",
	:quantity => 1,
	:cost => 80,
	:img => "ljubljana.jpg",
  },
  {
	:title => "Gambling money for casino in Opatija, Croatia",
	:description => "Write us a note with what you'd like us to bet on",
	:quantity => 5,
	:cost => Float::INFINITY,
	:img => "casino.jpg",
  },
  {
	:title => "Entrance to Plitvice Lakes National Park",
	:description => "A day of hiking by the beautiful lakes and waterfalls in the largest national park in Croatia",
	:quantity => 1,
	:cost => 40,
	:img => "plitvice.jpg",
  },
  {
	:title => "Dinner in Vodice",
	:description => "Dinner in the seaside town of Vodice",
	:quantity => 1,
	:cost => 100,
	:img => "vodice.jpg",
  },
  {
	:title => "Boat excursion in KRKA national park",
	:description => "Boat tour of the clear natural pool, waterfalls, cascades, and the 14th century monestary",
	:quantity => 1,
	:cost => 80,
	:img => "krka.jpg",
  },
  {
	:title => "Lunch at the Split Farmer's Market",
	:description => "Fresh produce, meats, pastries, and cheeses",
	:quantity => 1,
	:cost => 80,
	:img => "farmers-market.jpg",
  },
  {
	:title => "Catamaran to Hvar Island",
	:description => "2 hour sail to/from the beautiful island Hvar, Croatia",
	:quantity => 2,
	:cost => 20,
	:img => "catamaran.jpg",
  },
  {
	:title => "Scooter rental on Hvar Island",
	:description => "The best way to get around on the tiny streets, to get to see all the hidden gems spread across the island",
	:quantity => 1,
	:cost => 80,
	:img => "scooter.jpg",
  },
  {
	:title => "Ferry from Croatia to Italy",
	:description => "Fall asleep in Croatia, wake up in Italy",
	:quantity => 1,
	:cost => 325,
	:img => "ferry.jpg",
  },
  {
	:title => "Bolognese in Bologna",
	:description => "When in Bologna, eat Bolognese",
	:quantity => 2,
	:cost => 80,
	:img => "bolognese.jpg",
  },
  {
	:title => "Parma in Parma",
	:description => "When in Parma, eat Parma ham",
	:quantity => 1,
	:cost => 150,
	:img => "parma.jpg",
  },
  {
	:title => "Gourmet food tour in Parma",
	:description => "A tour of the production of Parmigiano Reggiano, Balsamic Vinegar, and Parma Ham, including a gourmet lunch with a tasting of Culatello Ham, the most exclusive cured meat in the world",
	:quantity => 1,
	:cost => 260,
	:img => "culatello.jpg",
  },
  {
	:title => "Gondola ride in Venice",
	:description => "A 40 minute romantic gondola ride with live music",
	:quantity => 1,
	:cost => 100,
	:img => "gondola.jpg",
  },
  {
	:title => "Hotel in Venice",
	:description => "Beautiful hotel overlooking the Rialto Bridge and the Grand Canal",
	:quantity => 1,
	:cost => 350,
	:img => "rialto.jpg",
  },
    {
	:title => "Dinner in Venice",
	:description => "Dinner by the side of the Grand Canal or in a lovely Piazza",
	:quantity => 1,
	:cost => 200,
	:img => "venice-restaurant.jpg",
  },
  {
	:title => "Frankfurters in Frankfurt",
	:description => "When in Frankfurt, eat Frankfurters",
	:quantity => 1,
	:cost => 80,
	:img => "frankfurter.jpg",
  }
]

registry_items.each do |registry_item|
  next if RegistryItem.find_by_title(registry_item[:title])
  RegistryItem.create!(:title => registry_item[:title], :description => registry_item[:description], :quantity => registry_item[:quantity], :cost => registry_item[:cost], :img => registry_item[:img])
end