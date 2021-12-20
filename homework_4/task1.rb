class Brick
    attr_accessor :color

    def initialize(color)
        @color = color
    end
    
    # brick has a 20% chance of being broken when created
    def choose(weight = 80)
        chance = rand() # value between 0 and 1
        chance <= weight / 100.0
    end
    
    # create a given number of bricks
    def createbrick(col)
        brick = Array.new(col) {Array.new}
        i = 0
        sn = 1
        while i < col do
            brick[i] << @color.sample
                if choose == true
                    brick[i] << "unbroken"
                    brick[i] << sn + i
                else
                    brick[i] << "broken"
                    brick[i] << nil
                    sn = sn - 1
                end
            i += 1  
        end
        return brick 
    end   
end

class BricksFactory < Brick

    # create a given number of bricks
    def createbricks(col)
        @br = createbrick(col)
    end 

    # total number of unbroken bricks
    def unbroken?
        @br.flatten.count("unbroken")
    end 

    # return the last 10 created unbroken bricks of the requested color
    def last10Bricks(color)
        @br.lazy.select {|i| i.first == color && i[1] == "unbroken" }.first(10)
    end

    # return a sorted array of unbroken bricks (sorting by color)
    def sortBricksColor(color)
        @br.select {|i| i[1] == "unbroken" }.sort_by { |s| s.first.scan(color) }.reverse
    end 

end

color = ["red", "blue", "green", "black", "yelow", "white"]
b = BricksFactory.new(color)

# create a given number of bricks
b.createbricks(50)
# total number of unbroken bricks
p b.unbroken?
puts ' '
# return the last 10 created unbroken bricks of the requested color
p b.last10Bricks("black")
puts ' '
# return a sorted array of unbroken bricks (sorting by color)
p b.sortBricksColor("white")