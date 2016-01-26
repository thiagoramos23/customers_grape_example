# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  street      :string
#  city_id     :integer
#  zip_code    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#

class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :customer
end
