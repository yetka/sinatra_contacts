require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('./lib/address')
require('pry')

get('/') do
  @list = Contact.all()
  erb(:list)
end

post('/output1') do
  first_name = params["first_name"]
  last_name = params["last_name"]
  job_title = params["job_title"]
  company = params["company"]
  contact_type = params["contact_type"]

  contact = Contact.new({:first_name=> first_name, :last_name=> last_name, :job_title=> job_title, :company=> company, :contact_type=> contact_type})
  contact.save()
  @list = Contact.sort()
  erb(:list)
end

get('/contact/:id') do
  @contact = Contact.find(params[:id])
  erb(:contact)
end

post('/output_address') do
  @list = Contact.all()
  # street = params["street"]
  # city = params["city"]
  # state = params["state"]
  # zip = params["zip"]
  #
  # address = Address.new({:street=> street, :city=> city, :state=> state, :zip=> zip})
  # # @contact.add_address(address)
  erb(:list)
end
