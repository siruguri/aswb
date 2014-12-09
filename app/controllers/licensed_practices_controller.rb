class LicensedPracticesController < ApplicationController
  before_filter :load_licensed_practice
  load_and_authorize_resource
  
  def show
    jurisdiction_id = params[:jurisdiction_id]

    @req_change = Change.where(jurisdiction_id: jurisdiction_id, practice_info_id: @licensed_practice.practice_info_id, confirmed: false, changed_key: params[:changed_key])[0]
    @comments = @req_change.comments
    @comment = Comment.new
  end

  private
  def load_licensed_practice
    @licensed_practice = LicensedPractice.find_by(practice_info_id: params[:id], jurisdiction_id: params[:jurisdiction_id])
  end
end
