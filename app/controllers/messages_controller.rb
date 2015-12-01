class MessagesController < ApplicationController
  before_action :set_person
  before_action :set_proposal, only: [:index, :new, :create]
  before_action :set_recipient, only: [:create]

  # show all messages according to proposals
  # deals with read boolean
  def inbox
    @conversations = @person.conversations
  end

  # show all messages of one proposal
  def index
    @messages = Message.where(proposalp_id: @proposal.id).order(created_at: :asc)
    @received_messages = @person.received_messages.where(proposal_id: @proposal.id).order(created_at: :asc)
    @sent_messages = @person.sent_messages.where(proposal_id: @proposal.id).order(created_at: :asc)
  end

  # form to send message
  def new
    @message = @proposal.messages.new
  end

  # send message
  def create
    @message = @proposal.messages.new(message_params)
    @message.messageable = @person
    @message.recievable = @recipient
    if @message.save
      redirect_to inbox_path
    else
      render 'new'
    end
  end

  private
    def set_person
      @person = current_user || current_brand
    end

    def set_proposal
      @proposal = Proposal.find(params[:proposal_id])
    end

    def message_params
      params.require(:message).permit(:text)
    end

    def set_recipient
      if current_user
        @recipient = @proposal.job.brand
      elsif current_brand
        @recipient = @proposal.user
      end
    end

end
