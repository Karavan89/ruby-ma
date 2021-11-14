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
    # validation check email
    def is_valid_email?
        if @email.nil? == false
            if @email.kind_of?(String)
                if @email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
                    true
                else
                    false
                end
            else
                false
            end
        else
            false
        end
    end
    # validation check "first_name" and "last_name"
    def valid?
        if @first_name.kind_of?(String) and @last_name.kind_of?(String)
            if @first_name.length <= 2 and @last_name.length <= 2
                true
            else
                false
            end 
        else
            false
        end
    end
    # handling errors and writing them to an array
    def errors
        error = []
        # error first_name 
        if @first_name.nil? 
            error << "first_name can not be empty"
        else
            if @first_name.kind_of?(String)
                if @first_name.length <= 2
                    error << "first_name must be at least three characters"
                end 
            else
                error << "first_name must be a string"
            end
        end
        # error last_name 
        if @last_name.nil? 
            error << "last_name can not be empty"
        else
            if @last_name.kind_of?(String)
                if @last_name.length <= 2
                    error << "last_name must be at least three characters"
                end 
            else
                error << "last_name must be a string"
            end
        end
        # error email 
        if @email.nil? 
            error << "Email can not be empty"
        else
            if @email.kind_of?(String)
                if is_valid_email? == false
                    error << "email is invalid"
                end 
            else
                error << "Email must be a string"
            end
        end
        # return error array
        return error
    end
end

u1 = User.new('John', nil, 'Doe.Johngmail.com')
puts "First name: #{u1.first_name}" # => John
puts "Last name: #{u1.last_name}" # =>
puts "Email: #{u1.email}" # => Doe.Johngmail.com
puts "Full name: #{u1.full_name}" # => John Do
puts "Valid_email: #{u1.is_valid_email?}" # => false
puts "User is valid: #{u1.valid?}" # => false
puts "Errors: #{u1.errors}" # => ["last_name can not be empty", "last_name must be a string", "email is invalid"]
puts ''

