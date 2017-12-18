class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :update, :destroy]

  def index
    page = params[:page] || 1
    @talks = Talk.all.paginate(page: page)
    render json: @talks
  end

  def show
    @talk = Talk.find(params[:id])
    render json: @talk
  end

  def create
    @talk = Talk.create(talk_params)
    if @talk.save
      render json: @talk, status: :created
    else
      render json: {
        "error": "failed to create: #{@talk.errors.full_messages.join(', ')}",
      }, status: :unprocessable_entity
    end
  end

  def update
    @talk.update(talk_params)
    head :no_content
  end

  def destroy
    @talk.destroy
    head :no_content
  end

  private

  def talk_params
    params.permit(:title, :category, :description, :length_of_talk)
  end

  def set_talk
    @talk = Talk.find(params[:id])
  end
end
