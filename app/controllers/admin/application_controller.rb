class Admin::ApplicationController < ApplicationController
  layout 'admin/application'

  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
end
