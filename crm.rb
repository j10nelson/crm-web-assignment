require 'sinatra'
require_relative 'contact'

# Creating some fake data
Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
#Done creating fake data


get '/' do

  @crm_app_name = "Alex's CRM"

  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :add
end
