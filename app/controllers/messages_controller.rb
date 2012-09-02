class MessagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    @messages = current_user.send("#{ params[:scope] }_messages")
    respond_with @messages
  end

  def show
    @message = Message.find(params[:id])
    respond_with @message
  end

  def new
  end

  def create
    @message = current_user.sent_messages.build(params[:message])
    @message.receiver = params[:receiver]
    respond_with @message
  end
end