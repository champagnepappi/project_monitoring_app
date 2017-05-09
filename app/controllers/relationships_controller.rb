class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    student = User.find_by(id: params[:supervised_id])
    lec = Lecturer.find_by(id: params[:supervisor_id])
    lec.supervise(student)
    redirect_to users_path
  end
end
