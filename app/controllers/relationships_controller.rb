class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    student = User.find_by(id: params[:supervised_id])
    lec = Lecturer.find_by(id: params[:supervisor_id])
    lec.supervise(student)
    student.update_attribute(:status, "assigned")
    respond_to do |format|
      format.html {redirect_to users_path}
      format.js
    end
  end
end
