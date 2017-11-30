class Contact
  @@list =[]
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :job_title
  attr_accessor :company
  attr_accessor :contact_type
  attr_accessor :address
  attr_reader :id


  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)
    @address = []
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def save()
    @@list.push(self)
  end

  def self.clear()
    @@list = []
  end

  def self.find(id)
    contact_id = id.to_i()
    @@list.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end

  def self.sort()
    @@list.sort_by{ |item| item.last_name }
  end

  def add_address(address)
    @address.push(address)
  end

end
