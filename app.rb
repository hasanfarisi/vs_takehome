puts "Enter the path you want to check: (ex: $/home/user/Downloads/)"
path = gets.chomp
files = Array.new
indexs = 0
max = 0

if path == ""
    puts "\nPlease enter the path!"
    return
end

Dir.glob("#{path}/**/*") do |file_path|
    file = File.basename(file_path, ".*")
    files.append(file)
end 

hash_data = Hash.new(0)

files.each do |value|
    hash_data[value]+= 1
end

max_key = hash_data.key(hash_data.values.max)
max_value = hash_data.values.max

if max_value == nil
    puts "\nPlease enter the correct path!"
    return
end

puts "\nResult: "
unless max_value >= 2
    puts "Sorry, there are no duplicate filenames"
else
    puts "#{max_key} #{max_value}"
end