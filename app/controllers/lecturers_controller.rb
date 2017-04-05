class LecturersController < ApplicationController
  def new
    @lec = Lecturer.new
  end
end
