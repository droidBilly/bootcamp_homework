# main.rb
require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def copy_contacts_names_and_phones
  read_contacts.map {|contact| contact_hash = { "#{contact[:name]}": "#{contact[:phone]}"}}
end

def copy_contacts_from_usa
  read_contacts.select{|contact| contact[:phone] =~ /^[+]1/} #regex for starts with +1
end

def copy_contacts_with_org
  read_contacts.select{|contact| contact[:email] =~ /[.][o][r][g]/} #regex for starts with +1
end

def count_contacts_from_usa
  copy_contacts_from_usa.reduce(0) {|counter|
    counter += 1
  }
end

def count_contacts_with_org
  copy_contacts_with_org.reduce(0) {|counter|
    counter += 1
  }
end

puts "Excercise 1:(Copy of Contacts array which holds name as key and phone to value)"
puts copy_contacts_names_and_phones.inspect
puts "--------------------"
puts "Excercise 2.1:(Shows only contacts where phone starts with '+1')"
puts copy_contacts_from_usa
puts "--------------------"
puts "Excercise 2.2:(Shows only contacts where email contains '.org')"
puts copy_contacts_with_org
puts "--------------------"
puts "Excercise 3:1(Counts contacts with phone starts with '+1')"
puts count_contacts_from_usa
puts "--------------------"
puts "Excercise 3:2(Counts contacts with emails contain '.org')"
puts count_contacts_with_org
puts "--------------------"
