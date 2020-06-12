module ClassTeachersHelper

  def get_user_teacher(cls)
    role = ''
    school = cls.school
    school.users.each do |user|
      role = user.roles.first.name
    end
    role
  end

end
