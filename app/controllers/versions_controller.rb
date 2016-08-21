class VersionsController < ApplicationController
  before_action :admin_user

  def index
  	@versions = PaperTrail::Version.order(id: :desc).page(params[:page])
  end

  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
