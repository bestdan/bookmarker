# frozen_string_literal: true

class UserSerializer < BaseSerializer
  attributes :email
end

#------

# app/views/messages/show.json.jbuilder

# json.content format_content(@user.content)
# json.call(@user, :created_at, :updated_at)

# json.user do
#  json.message 'hi there'
#  json.id @user.id
#  json.email @user.email
#  json.password @user.password
# end
