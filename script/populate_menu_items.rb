#!/usr/bin/env ruby

menu_items = [
  {
    :course => MenuItem.courses[:entree],
    :items => [
      {
        :title => "Tagliata di manzo piemontese con rucola",
        :description => "Piemontese beef filet sliced and served with arugula salad and balsamic reduction",
      },
      {
        :title => "Dentice alla ligure",
        :description => "Pan seared wild Thai snapper fillet served with fennel, cherry tomatoes, taggiasca olives, and Pigato white wine",
      },
    ]
  },
  {
    :course => MenuItem.courses[:dessert],
    :items => [
      {
        :title => "Tiramisu della casa",
        :description => "House made traditional tiramisu",
      },
      {
        :title => "Tortino al cioccolato",
        :description => "House made chocolate cake",
      },
      {
        :title => "Latte dolce fritto",
        :description => "Traditional Genovese lightly fried milk custard",
      },
    ]
  },
]

menu_items.each do |menu_item|
  course = menu_item[:course]
  menu_item[:items].each do |item|
    next if MenuItem.find_by_title(item[:title])
    MenuItem.create!(:course => course, :title => item[:title], :description => item[:description])
  end
end