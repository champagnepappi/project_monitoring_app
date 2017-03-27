class UserPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope
  #   end
  # end
  def permitted_attributes
    if user.lecturer
      [:first_name, :last_name, :email,:password, :password_confirmation]
    else
      [:first_name, :last_name, :email, :gender, :course_taken, :department, :password, :password_confirmation]
    end
  end
end
