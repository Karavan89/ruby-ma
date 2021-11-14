class Brackets

    attr_accessor :brackets

    def initialize(brackets)
        @brackets = brackets
    end
    
    def valid?
        if @brackets.match(/(\{\[\(\)\]\})|(\<\<\>\>)/)
            puts true
        else
            puts false
        end
    end

end

Brackets.new('{(})').valid?   # => false
Brackets.new('{{[]').valid?   # => false
Brackets.new('{[()]}').valid? # => true
Brackets.new('<<>>').valid?   # => true

#'{(})'.valid?   # => false
# '{{[]'.valid?   # => false
# '{[()]}'.valid? # => true
# '<<>>'.valid?   # => true

