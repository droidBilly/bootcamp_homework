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

puts copy_contacts_names_and_phones.inspect
puts copy_contacts_from_usa
