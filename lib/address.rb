class Address
  attr_reader :street
  attr_reader :city
  attr_reader :state
  attr_reader :zip


  def initialize(attributes)
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
  end
end
