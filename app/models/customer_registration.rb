class CustomerRegistration < ApplicationRecord

	validates :email, :presence => true

  enum source_of_hearing: [:tv, :facebook, :mobile_advertisement, :newspaper]
  enum hobby: [:games, :movies, :singing, :dancing, :reading]

  def country_name
    c = ISO3166::Country[self.country]
    c.try(:name)
  end
end