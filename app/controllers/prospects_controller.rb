class ProspectsController < ApplicationController
  before_action :find_prospect, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    if params[:status] == nil

      if params[:search]
        @prospects = Prospect.search(params[:search]).order("created_at DESC")
      else
        @prospects = Prospect.all.order('user_id DESC')
        
        # respond_to do |format|
        #   format.html
        #   format.csv { send_data @prospects.to_csv, filename: "Prospects-#{Date.today}.csv" }
        # end
        
      end

    else
      @prospects = Prospect.where(status: params[:status])
    end
    @status = Prospect.select(:status).order(:status).distinct
  end
  
  def show
  end
  
  def new
    @prospect = current_user.prospects.build
  end
  
  def create
    @prospect = current_user.prospects.build(prospect_params)
    if @prospect.save
      flash[:success] = "New prospect added."
      redirect_to prospects_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @prospect.destroy
    flash[:danger] = "Prospect has been deleted."
    redirect_to root_path
  end

  private
    def prospect_params
      params.require(:prospect).permit(:organization, :street_address, :address2, :city, :state, :zip, :phone, :website, :employees, :revenue, :vc_already, :prospect_note, :intro_presentation_date, :estimated_ap, :sm_presentation_date, :actual_ap, :sm_conversion_est, :conversion_percentage, :status, :agreement_date, :sm_received_date, :sm_status, :contact1_first_name, :contact1_last_name, :contact1_title, :contact1_phone, :contact1_mobile, :contact1_email, :contact2_first_name, :contact2_last_name, :contact2_title, :contact2_phone, :contact2_mobile, :contact2_email, :primary_contact, :intro_presenter, :sm_presenter, :close_date, :references_given)
    end

    def find_prospect
      @prospect = Prospect.find(params[:id])
    end

end