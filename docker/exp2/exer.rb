require "json"
require "faker"

fake_data = {}

fake_data["name"] = Faker::Name.name      #=> "Christophe Bartell"

fake_data["address"] = Faker::Address.full_address #=> "5479 William Way, East Sonnyhaven, LA 63637"

fake_data["data"] = Faker::Alphanumeric.alpha(number: 10) #=> "zlvubkrwga"

fake_data["language"] = Faker::ProgrammingLanguage.name #=> "Ruby"

file = File.open(ENV["FILE_PATH"], "w+")
JSON.dump(fake_data, file)

file.close

# print
