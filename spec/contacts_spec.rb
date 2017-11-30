require('rspec')
require('contacts')
require('address')

describe("Contact") do
  before() do
    Contact.clear()
  end

  describe("#first_name") do
    it("returns the first name of a contact") do
      new_contact = Contact.new({:first_name=> "Malgorzata", :last_name=> "Haniszewska", :job_title=> "DVM", :company=> "Azory", :contact_type=> "email"})
      expect(new_contact.first_name()).to(eq("Malgorzata"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves new contact to the list of contacts") do
      new_contact = Contact.new({:first_name=> "Malgorzata", :last_name=> "Haniszewska", :job_title=> "DVM", :company=> "Azory", :contact_type=> "email"})
      new_contact.save()
      expect(Contact.all()).to(eq([new_contact]))
    end
  end

  describe(".clear") do
    it("clears all contacts from the list") do
      new_contact = Contact.new({:first_name=> "Malgorzata", :last_name=> "Haniszewska", :job_title=> "DVM", :company=> "Azory", :contact_type=> "email"})
      new_contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new new contact is added") do
      new_contact = Contact.new({:first_name=> "Malgorzata", :last_name=> "Haniszewska", :job_title=> "DVM", :company=> "Azory", :contact_type=> "email"})
      new_contact.save()
      new_contact2 = Contact.new({:first_name=> "Tomasz", :last_name=> "Wiszkowski", :job_title=> "programmer", :company=> "Google", :contact_type=> "email"})
      new_contact2.save()
      expect(new_contact.id()).to(eq(1))
      expect(new_contact2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds an new contact based on its id") do
      new_contact1 = Contact.new({:first_name=> "Malgorzata", :last_name=> "Haniszewska", :job_title=> "DVM", :company=> "Azory", :contact_type=> "email"})
      new_contact1.save()
      new_contact2 = Contact.new({:first_name=> "Tomasz", :last_name=> "Wiszkowski", :job_title=> "programmer", :company=> "Google", :contact_type=> "email"})
      new_contact2.save()
      expect(Contact.find(1)).to(eq(new_contact1))
      expect(Contact.find(2)).to(eq(new_contact2))
    end
  end

  describe(".sort") do
    it("sort the new_contacts based on their names") do
      new_contact1 = Contact.new({:first_name=> "Tomasz", :last_name=> "Wiszkowski", :job_title=> "programmer", :company=> "Google", :contact_type=> "email"})
      new_contact1.save()
      new_contact2 = Contact.new({:first_name=> "Malgorzata", :last_name=> "Haniszewska", :job_title=> "DVM", :company=> "Azory", :contact_type=> "email"})
      new_contact2.save()
      expect(Contact.sort()).to(eq([new_contact2,new_contact1]))
    end
  end

  describe("#add_address") do
    it("add address to a new contact") do
      new_contact1 = Contact.new({:first_name=> "Malgorzata", :last_name=> "Haniszewska", :job_title=> "DVM", :company=> "Azory", :contact_type=> "email"})
      new_contact1.save()
      new_address = Address.new({:street=> "1st", :city=> "Seattle", :state=> "WA", :zip=> 98113})
      expect(new_contact1.add_address(new_address)).to(eq([new_address]))
    end
  end

end
