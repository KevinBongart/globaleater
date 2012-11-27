Country.delete_all
open("countries.txt") do |countries|
  countries.read.each_line do |country|
    name = country.chomp
    Country.create!(:name => name)
  end
end
