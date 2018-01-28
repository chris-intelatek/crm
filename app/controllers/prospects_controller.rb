class ProspectsController < ApplicationController
  before_action :find_prospect, only: [:show, :edit, :update, :destroy]
  
  def index
    @prospects = Prospect.all.order("created_at DESC")
  end
  
  def show
  end
  
  def new
    @prospect = Prospect.new
  end
  
  def create
    @prospect = Prospect.new(prospect_params)
    if @prospect.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @prospect.update(prospect_params)
      redirect_to prospect_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @prospect.destroy
    redirect_to root_path
  end

  private
    def prospect_params
      params.require(:prospect).permit(:organization, :street_address, :address2, :city, :state, :zip, :phone, :website, :employees, :revenue, :vc_already, :prospect_note, :intro_presentation_date, :estimated_ap, :sm_presentation_date, :actual_ap, :sm_conversion_est, :conversion_percentage, :status, :agreement_date)
    end

    def find_prospect
      @prospect = Prospect.find(params[:id])
    end

end
