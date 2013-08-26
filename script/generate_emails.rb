#!/usr/bin/env ruby

UserCode.all.map(&:code).uniq.each do |code|
  users = UserCode.find_all_by_code(code).map(&:user).compact
  next if users.empty?
  puts "#{users.map(&:email).join(', ')}\n\n" +
  "Hello #{users.map{|u| u.name.split(' ').first}.join(', ')},\n" +
  "We hope you're getting excited, there's less than a month until the wedding. We've added a couple new sections to the wedding website, menu and registry. Please check them out, and be sure to choose your menu choices soon.\n" +
  "http://mr-mrs.struys.ca/menu\n" + 
  "\nKen & Nicole\n\n" +
  "ps: your sign in code is #{code}\n\n\n"
end