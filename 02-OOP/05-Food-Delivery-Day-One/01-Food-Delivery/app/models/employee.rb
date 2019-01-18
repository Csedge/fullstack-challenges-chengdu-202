require_relative '../models/base_model'

require 'digest'

class Employee < BaseModel
  attributes :username, :password, :role

  def valid_password?(password)
    salt, md5 = @password.split('-')
    Digest::MD5.hexdigest("#{salt}-#{password}") == md5
  end

  def manager?
    @role == 'manager'
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end
end
