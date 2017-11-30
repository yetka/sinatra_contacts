require('rspec')
require('contacts')

describe("Contact") do

  describe("#first_name") do
    it("returns the first name of a contact") do
      new_contact = Contact.new({:first_name=> "Malgorzata", :last_name=> "Haniszewska", :job_title=> "DVM", :company=> "Azory", :contact_type=> "email"})
      expect(new_contact.first_name()).to(eq("Malgorzata"))
    end
  end

end
