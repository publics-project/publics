class MessagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @messages = current_user.send("#{ params[:scope] }_messages")
    respond_with @messages
  end

  def show
    @message = Message.find(params[:id])
    respond_with @message
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.build(params[:message])
    @message.receiver = User.find(params[:message][:receiver_id])
    if @message.save
      redirect_to index_profile_messages_path('sent')
    else
      render :new
    end
  end
end