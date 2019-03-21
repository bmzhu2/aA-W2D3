class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end

    result
  end

  def two_sum
    sums = []

    (0...length-1).each do |i|
      (i+1...length).each do |j|
        sums << [i,j] if self[i] + self[j] == 0
      end
    end

    sums
  end
end

def my_transpose(arr)
  transposed = []

  (0...arr[0].length).each do |col|
    transposed_row = []
    (0...arr.length).each do |row|
      transposed_row << arr[row][col]
    end
    transposed << transposed_row
  end
  transposed
end

def stock_picker(arr)
  best_days = []
  biggest_diff = 0

  (0...arr.length-1).each do |i|
      (i+1...arr.length).each do |j|
        if arr[j] - arr[i] > biggest_diff
          biggest_diff = arr[j] - arr[i]
          best_days = [i,j]
        end
      end
    end
    best_days
end

class TowersOfHanoi

  attr_reader :size, :left, :middle, :right
  # @PEGS = {:left => @left, :middle => @middle, :right => @right}

  def initialize(size)
    @size = size
    @left = (1..size).to_a.reverse
    @middle = []
    @right = []
  end

  def move(selected, target)
    pegs= [left, right, middle]

    raise 'invalid peg' unless pegs.include?(selected) && pegs.include?(target)
    raise 'cannot choose same peg as target' if selected == target
    raise 'selected peg is empty' if selected.empty?

    if !target.empty? && selected[-1] > target[-1]
      raise 'disc is too big to move there'
    end

    target << selected.pop

  end

  def won?
    @right == (1..size).to_a.reverse
  end

  def play
    until won?
      begin
        puts "Choose the location of the disc you want to move (left, middle, or right)"
        selected = gets.chomp
        puts "Choose a target location to move the disc"
        target = gets.chomp

        case selected
        when "left"
          selected = left
        when "middle"
          selected = middle
        when "right"
          selected = right
        end

        case target
        when "left"
          selected = left
        when "middle"
          selected = middle
        when "right"
          selected = right
        end
        
        move(selected, target)

      rescue 'invalid peg'
        puts "Invalid input"
        retry
      rescue 'cannot choose same peg as target'
        puts "Can't put the disc at the same place"
        retry
      rescue 'selected peg is empty'
        puts "You selected an empty peg"
      rescue 'disc is too big to move there'
        puts "You selected a disc too big to move there"
      rescue StandardError
        puts "This shouldn't happen"
        retry
      end

    end

  end
end