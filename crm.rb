require_relative 'contact'
class CRM

  def initialize
    main_menu
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end

  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then Exit
    end

  end

  def add_new_contact
    print "Enter First Name:"
    first_name = gets.chomp

    print "Enter Last Name:"
    last_name = gets.chomp

    print "Enter Email:"
    email = gets.chomp

    print "Enter Contact Note:"
    note = gets.chomp

  Contact.create(first_name, last_name, email, note)

  end

  def print_attribute_menu
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] note"

  end

  def attribute_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      attribute_options(user_selected)
    end
end

  def attribute_options(attr_selected)
    case attr_selected
    when 1 then  attribute = "first_name"
    when 2 then  attribute = "last_name"
    when 3 then  attribute = "email"
    when 4 then attribute = "note"
    end
    return attribute
  end






  def modify_existing_contact
    print "enter contact id to be updated:"
    contact_id = gets.chomp.to_i
    print "what would you like to update:"
    print_attribute_menu
    attr_selected = gets.to_i
    attribute = attribute_options(attr_selected)
    print "Enter Updated Value:"
    updated_val = gets.chomp
    contact = Contact.find(contact_id)
    contact.update(attribute, updated_val)
end



  def delete_contact

  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
    print "How would you like to search through your contact?"
    print_attribute_menu
    user_selected = gets.to_i
    search_by_attribute = user_selected

    case user_selected
      when 1 then attribute = "first_name"
      when 2 then attribute = "last_name"
      when 3 then attribute = "email"
      when 4 then attribute = "note"
      end
    print "Enter Search Query:"
      query = gets.to_i
      Contact.all.each do |contact|
        if contact attribute == query
          return "#{contact}"
        end
      #prompts are good, but returns not working correctly


  end

  end

  app = CRM.new


end
