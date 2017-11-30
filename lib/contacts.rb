class Contact
  @@list =[]
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :job_title
  attr_accessor :company
  attr_accessor :contact_type


  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)
  end

end
