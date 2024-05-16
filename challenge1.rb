# Using a single puts statement build the following
# sentence using only data from the carl hash and the
# sagan array along with some string interpolation.
#
# We are a way for the cosmos to know itself.

carl  = {
          :toast => 'cosmos',
          :punctuation => [ ',', '.', '?' ],
          :words => [ 'know', 'for', 'we']
        }

sagan = [
          { :are => 'are', 'A' => 'a' },
          { 'waaaaaay' => 'way', :th3 => 'the' },
          'itself',
          { 2 => ['to']}
        ]

        puts "#{carl[:words][2].capitalize} #{sagan[0][:are]} #{sagan[0]['A']} #{sagan[1]['waaaaaay']} #{carl[:words][1]} #{sagan[1][:th3]} #{carl[:toast]} #{sagan[3][2][0]} #{carl[:words][0]} #{sagan[2]}#{carl[:punctuation][1]}"

        #Qn2
        ghosts =[
            {name:"Inky", age: 4, loves: "reindeers", net_worth: 25},
            {name:"Pinky", age: 5, loves: "garden tools", net_worth: 14},
            {name:"Blinky", age: 7, loves: "ninjas", net_worth: 18.03},
            {name:"Clyde", age: 6, loves: "yarn", net_worth: 0}
        ]
       
        ghosts.each do |ghost|
            ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
            ghost_info += "loves #{ghost[:loves]} and "
            ghost_info += "has #{ghost[:net_worth]} dollars in the bank."
            puts ghost_info
        end


        # QN 3


    require 'net/http'
require 'json'
require 'pp'
 
url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.
# pp dog_breeds # pp stands for pretty print.

breeds_hash = dog_breeds['message']

breeds_hash.each do |breed, sub_breeds|
  puts breed.capitalize # Print the breed name
  

  if sub_breeds.any?
    sub_breeds.each do |sub_breed|
      puts "  - #{sub_breed.capitalize}" # Print each sub-breed indented
    end
  end
end

#QN. 4

require 'net/http'
require 'json'
require 'pp'
 
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?%24limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_data = JSON.parse(response) # Convert JSON data into Ruby data.
# pp tree_data # pp stands for pretty print.
ash_tree_count = 0
 
tree_data.each_with_index do |tree, index|
  if tree['common_name']&.downcase.include?('ash') || tree['botanical_name']&.downcase.include?('fraxinus')
    ash_tree_count += 1
  end
end
 
puts "Number of Ash trees in the dataset: #{ash_tree_count}"