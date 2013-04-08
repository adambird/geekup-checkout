require_relative 'scanner'

scanner = Scanner.new

while true do
  puts scanner.scan gets
end
