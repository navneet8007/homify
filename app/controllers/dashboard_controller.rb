class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout :set_layout
  def index
  end

  def novice_users
    @novice_users = Novice.all
  end

  def edit_status_novice
   @novice =  Novice.find(params[:id])
  end

  def update_status
    @novice =  Novice.find(params[:novice][:id])
    respond_to do |format|
      if @novice.update(:status=>params[:novice][:status])
        format.html { redirect_to novices_path, notice: 'User status was successfully updated.' }
      else
        format.html { redirect_to novices_path, notice: 'There is some problem ,please try later.' }
      end
    end
  end

  def set_layout
	'dashboard'
  end
end




