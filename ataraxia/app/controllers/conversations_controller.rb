class ConversationsController < ApplicationController
  

  def index
    if session[:current_user_id] == nil
      redirect_to users_login_path
    else
      @users = User.all
      @conversations = Conversation.all
    end
  end

  def create
    if session[:current_user_id] == nil
      redirect_to users_login_path
    else
        if Conversation.between(params[:sender_id],params[:recipient_id]).present?
          @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
        else
          @conversation = Conversation.create!(conversation_params)
        end
        redirect_to conversation_messages_path(@conversation)
    end
  end

private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
