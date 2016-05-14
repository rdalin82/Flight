f = File.open("#{Rails.root}/lib/airports.txt")
lines = f.readlines
results = {}
lines.collect do |x| 
  fullname = x.split("(")[0].strip
  code = x.split("(")[1]
  results[fullname] = code[0, 3] if fullname && code
end 

# results.each { |k, v| puts k + "\t" +  v }
AIRPORTS = results 