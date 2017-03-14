# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'faker'
require 'populator'


Oem.create(name: "Xerox")
Oem.create(name: "Toshiba")
Oem.create(name: "Lexmark")
Oem.create(name: "Sharp")
Oem.create(name: "Ricoh")
Oem.create(name: "Dell")
Oem.create(name: "Kyocera")
Oem.create(name: "Konica Minolta")
Oem.create(name: "Samsung")
Oem.create(name: "Canon")


def r_bool
  b = rand(0..1)
  if b == 0
    return false
  else 
    return true
  end
end

def assign_name
  chars = ["x", "c", "ex", "a", "z"]
  max = chars.length - 1
  possible_ext = ["3001", "4000", "2003", "4022", "7886"]
  give_ext = rand(0..8)
  if give_ext == 6
    ext = possible_ext[rand(0..4)]
  else
    ext = ""
  end
  return chars[rand(0..max)] + rand(100..350).to_s + " " + ext
end
  

def assign_oem
  max = Oem.count - 1
  manufacturers = Oem.pluck(:name)
  return manufacturers[rand(0..max)]
end

def assign_platform
  platforms = ["Emb platform 1", "Emb platform 2", "Emb Platform 3", "Emb Platform 4", "Emb Platform 5"]
  max = platforms.length - 1
  return platforms[rand(0..max)]
end
 
def str_builder(str, max)
  return str + rand(1..max).to_s
end




Copier.populate(1000) do |c|
  c.name                    = assign_name
  c.oem                     = oem = assign_oem
  c.marketer                = oem
  c.pc_embedded             = r_bool
  c.embedded_platform       = assign_platform
  c.pc_int_scanning         = r_bool
  c.pc_dependency           = r_bool
  c.pc_dependency_detail    = "Dependency details"
  c.general_notes           = "General Notes about the copier and Papercut"
  c.aka                     = "Another Name"
  c.print                   = r_bool
  c.copy                    = r_bool
  c.scan                    = r_bool
  c.fax                     = r_bool
  c.card_reader_support     = r_bool
  c.vending_connector       = r_bool
  c.vending_connector_oem   = str_builder "vc_oem", 5
  c.vending_connector_ex    = str_builder "vc_ex", 4
  c.vending_connector_cpad  = str_builder "vc_cpad", 3
  c.card_reader_mode        = str_builder "card_reader_mode", 2
  c.card_reader_types       = str_builder "card_reader_types", 5
  
end

User.create(name: "Hunter B", email: "h@h.com", password: "foobar", password_confirmation: "foobar" )