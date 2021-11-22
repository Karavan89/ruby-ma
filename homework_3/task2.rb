class Brackets

    attr_accessor :brackets

    def initialize(brackets)
        @brackets = brackets
    end
    
    def valid?
        bracket = {
        "(" => ")",
        "{" => "}",
        "[" => "]",
        "<" => ">"
    }
    open_bracket = bracket.keys
    clos_bracket = bracket.values
    stack  = []
        @brackets.each_char do |ch|
            if open_bracket.include?(ch)
                stack << ch
            elsif clos_bracket.include?(ch)
                ch == bracket[stack.last] ? stack.pop : (return false)
            end
        end
      stack.empty?
    end 
end

puts Brackets.new('{(})').valid?   # => false
puts Brackets.new('{{[]').valid?   # => false
puts Brackets.new('{[()]}').valid? # => true
puts Brackets.new('<<>>').valid?   # => true
puts ''

#Extend the String class
class String
    def valid?
        bracket = {
        "(" => ")",
        "{" => "}",
        "[" => "]",
        "<" => ">"
      }
      open_bracket = bracket.keys
      clos_bracket = bracket.values
      stack  = []
        each_char do |ch|
            if open_bracket.include?(ch)
                stack << ch
            elsif clos_bracket.include?(ch)
                ch == bracket[stack.last] ? stack.pop : (return false)
            end
        end
      stack.empty?
    end 
end

puts '{(})'.valid?   # => false
puts '{{[]'.valid?   # => false
puts '{[()]}'.valid? # => true
puts '<<>>'.valid?   # => true