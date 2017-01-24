class Contact
    attr_accessor :first_name, :last_name, :email, :phone, :note
    attr_reader :id

    @@contacts = []
    @@next_id = 1000

    def initialize(first_name, last_name, email, phone, note)
        @id = @@next_id # add the unique ID to the new contact
        @first_name = first_name
        @last_name = last_name
        @email = email
        @phone = phone
        @note = note

        @@next_id += 1 # increment the unique id counter
    end

    def self.create(first_name, last_name, email, phone, note)
        new_contact = new(first_name, last_name, email, phone, note) # 1. initialize new contact
        @@contacts << new_contact # 2. add contact to contacts array
        new_contact # returns the new contact
    end

    def self.all
        @@contacts
    end

    # This method should accept an id as an argument
    # and return the contact who has that id
    def self.find(by_id)
        @@contacts.each do |contact|
            return contact if contact.id == by_id
        end
    end

    # This method should allow you to specify
    # 1. which of the contact's attributes you want to update
    # 2. the new value for that attribute
    # and then make the appropriate change to the contact
    def update(attribute, new_value)
        if attribute == 'email'
            self.email = new_value
        elsif attribute == 'first_name'
            self.first_name = new_value
        elsif attribute == 'last_name'
            self.last_name = new_value
        elsif attribute == 'phone'
            self.phone = new_value
        elsif attribute == 'note'
            self.note = new_value
        end
    end

    # This method should work similarly to the find method above
    # but it should allow you to search for a contact using attributes other than id
    # by specifying both the name of the attribute and the value
    # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
    def self.find_by(attribute, value)
        @attribute = attribute
        @value = value

        @@contacts.each do |contact|
            if attribute == 'id'
                search_by = contact.id
                search_value = value.to_i
            elsif attribute == 'first_name'
                search_by = contact.first_name
                search_value = value
            elsif attribute == 'last_name'
                search_by = contact.last_name
                search_value = value
            elsif attribute == 'email'
                search_by = contact.email
                search_value = value
            elsif attribute == 'phone'
                search_by = contact.phone
                search_value = value
            elsif attribute == 'note'
                search_by = contact.note
                search_value = value
            end
            return contact if search_by == search_value
        end
        nil
    end

    # This method should delete all of the contacts
    def self.delete_all
        @@contacts = [] # Empties @@contacts array, but does not delete contacts instances
    end

    def full_name
        "#{first_name} #{last_name}"
    end

    def delete
        @@contacts.delete(self)
    end

    # Feel free to add other methods here, if you need them.
end
