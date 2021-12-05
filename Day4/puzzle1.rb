# frozen_string_literal: true

data = File.read('input.txt').split("\n\n").reject(&:empty?).map(&:strip)
solutions = data[0]
boards = []
data.drop(1).each { |board| boards << Array[board] }

newboards = []
boards.each { |board| newboards << board.join.split("\n").each(&:strip!) }

nestedboards = []
newboards.each do |board|
  newer = []
  board.each do |row|
    newer << row.split
  end
  nestedboards << newer
end

transposedboards = nestedboards.map(&:transpose)

answerboard = []
winningnumber = ''
catch :answers do
  solutions.split(',').each do |answer|
    nestedboards.collect do |boards|
      boards.collect do |board|
        next unless board.include?(answer)

        board[board.index(answer)] = 'X'
        if board.all?('X')
          answerboard << nestedboards.index(boards)
          answerboard << boards.index(board)
          winningnumber = answer
          throw :answers
        end
      end
    end

    transposedboards.collect do |boards|
      boards.collect do |board|
        next unless board.include?(answer)

        board[board.index(answer)] = 'X'
        if board.all?('X')
          answerboard << nestedboards.index(boards)
          answerboard << boards.index(board)
          winningnumber = answer
          throw :answers
        end
      end
    end
  end
end

