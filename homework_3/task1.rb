class User
    attr_accessor :first_name, :last_name, :email

    def initialize(first_name, last_name, email)
        @first_name = first_name
        @last_name = last_name
        @email = email
    end

    def full_name
        "#{@first_name} #{@last_name}"
    end
    # handling errors and writing them to an array
    def errors
        error = Hash[]
        # error first_name  
            error[:first_name] = "first_name can not be empty" if @first_name.nil?
            error[:first_name] = "first_name must be a string" if @first_name.nil? == false && @first_name.kind_of?(String) != true
            error[:first_name] = "first_name must be at least three characters" if @first_name.kind_of?(String) && @first_name.length <= 2
        # error last_name 
            error[:last_name] = "last_name can not be empty" if @last_name.nil?
            error[:last_name] = "last_name must be a string" if @last_name.nil? == false && @last_name.kind_of?(String) != true
            error[:last_name] = "last_name must be at least three characters" if @last_name.kind_of?(String) && @last_name.length <= 2 
        # error email 
            error[:email] = "Email can not be empty" if @email.nil?
            error[:email] = "Email must be a string" if @email.nil? == false && @email.kind_of?(String) != true
            error[:email] = "email is invalid" if @email.kind_of?(String) && @email.to_s.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i).nil? == true
        # return error array
        return error
    end
    # validation check email
    def is_valid_email?
        errors[:email].nil?
    end
    # validation check "first_name" and "last_name"
    def valid?
        errors[:first_name].nil? && errors[:last_name].nil?
    end
end

u1 = User.new('John', nil, 'john.doemail.com')
puts "First name: #{u1.first_name}" # => John
puts "Last name: #{u1.last_name}" # =>
puts "Email: #{u1.email}" # => Doe.Johngmail.com
puts "Full name: #{u1.full_name}" # => John Do
puts "Valid_email: #{u1.is_valid_email?}" # => false
puts "User is valid: #{u1.valid?}" # => false
puts "Errors: #{u1.errors}" # => ["last_name can not be empty", "last_name must be a string", "email is invalid"]
puts ''
