class Teacher::ApplicationController < ApplicationController
  layout 'teacher/application'

  skip_before_action :authenticate_user!
  before_action :authenticate_teacher!
end
