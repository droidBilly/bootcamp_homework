# main.rb
require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def copy_contacts_names_and_phones
  contact_hash = Hash.new
  result = read_contacts.map {|contact| contact_hash = { "#{contact[:name]}": "#{contact[:phone]}"}}
end

puts result = copy_contacts_names_and_phones
