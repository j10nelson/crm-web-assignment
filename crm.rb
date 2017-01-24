require 'sinatra'
require_relative 'contact'

# # Creating some fake data
# Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
# Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
# Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
# #Done creating fake data
# 3

get '/' do

  @crm_app_name = "Alex's CRM"

  erb :index
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])

  redirect to('/contacts')

end

get '/contacts/new' do
  erb :new
end
