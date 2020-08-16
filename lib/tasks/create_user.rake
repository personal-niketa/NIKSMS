desc 'Add customer registration user'
namespace :tasks do
  task add_customer_regisration_user: :environment do
    if Rails.env.development?
      puts "----Customer Registration user creation started-----"
      customer_registration = CustomerRegistration.new(
        first_name: 'Vikas',
        last_name: 'Patel',
        hobby: 'movies',
        email: 'vikasp@yopmail.com',
        source_of_hearing: 'tv',
        country: 'india'
      )
    end
    if customer_registration.save
      puts "---Customer Registration user--=#{customer_registration.email}---created--successfully--"
    else
      puts "-----Customer Registration user is not created due to errors=#{customer_registration.errors.full_messages}-----"
    end
  end
end

