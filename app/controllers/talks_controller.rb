class TalksController < ApplicationController
  def index
    @talks = Talk.all
    render json: @talks
  end

  def show
    @talk = Talk.find(params[:id])
    render json: @talk
  end

  def create
    talk = Talk.create(talk_params) 
    if talk.save
      render json: talk, status: :created 
    else
      render json: { "error": "failed to create" }
    end
  end

  private

  def talk_params
    params.permit(
      :title,
      :category,
      :description
    )
  end

end
