# == Schema Information
#
# Table name: customers
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  phone        :string
#  mobile_phone :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Customer < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates_presence_of :email
end
