class ProposalsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @proposal=Proposal.new(params[:proposals].permit(:property_id,:lesee_id,:user_id))
	@proposal.save
	redirect_to(:back)

  end
  
  def accept
      property=Property.find(params[:property_id])
      property.update(lesee: params[:lesee_id])
      property.update(available: '0')
      property.save
      proposal = Proposal.find(params[:proposal_id])
      proposal.destroy
      Proposal.destroy_all(property_id: params[:property_id])
      redirect_to users_dashboard_path
  end

  def destroy
  end
end
