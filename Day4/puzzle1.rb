data = File.read("input.txt").split("\n\n").reject(&:empty?).map(&:strip)
solutions = data[0]
boards = []
data.drop(1).each{ |board| boards << Array[board] }

newboards = []
boards.each { |board| newboards << board.join.split("\n").each{|row| row.strip!} }

nestedboards = []
newboards.each do |board|
    newer = []
    board.each do |row|
        newer << row.split
    end
    nestedboards << newer
end
p nestedboards