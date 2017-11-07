# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: :create

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all.page(params[:page]).per(10)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end


  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      ActionController::Parameters.new(f(params.to_unsafe_hash)).permit(:from, :to, :body)
    end

    def f(h)
      Hash[h.map { |k, v| v.class == Array ? [k, v.map { |r| f r }.to_a] : [k.downcase, v] }].deep_symbolize_keys
    end
end
