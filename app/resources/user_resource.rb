class UserResource < JSONAPI::Resource
  attributes :email, :name, :password, :password_confirmation

  def fetchable_fields
    super - %i(password password_confirmation)
  end
end
