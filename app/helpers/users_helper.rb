module UsersHelper
  def prepare_user_roles
    [['ADMIN', 'admin'], ['PRINCIPAL', 'principal' ], ['TEACHER', 'teacher']]  
  end

  def user_role(user)
  	user.roles.first.name.upcase
  end
end