class CustomerRegistration < ApplicationRecord

  validates_presence_of :email, :first_name
  validates_uniqueness_of :email

  enum source_of_hearing: [:tv, :facebook, :mobile_advertisement, :newspaper]
  enum hobby: [:games, :movies, :singing, :dancing, :reading]

  def country_name
    c = ISO3166::Country[self.country]
    c.try(:name)
  end
end