class SequencesController < ApplicationController
  load_and_authorize_resource
  include SequencesHelper
  before_action :authenticate_user!

  def index
    @sequences = filtrate(@sequences, 'name desc', pagination: true, pages: 10)
  end

  def show; end

  def new; end

  def edit; end

  def create
    @sequence.save
    respond_with(@sequence)
  end

  def update
    @sequence.update(sequence_params)
    respond_with(@sequence)
  end

  def destroy
    @sequence.destroy
    respond_with(@sequence)
  end

  def statistics
    @users = @sequence.edition.user_editions.where(role: ["camper", "semitutor", "applicant"]).map { |e| e.user }
  end

  private

  def sequence_params
    params.require(:sequence).permit(:name, :content, :sequence_start, :sequence_end, :edition_id)
  end

end
