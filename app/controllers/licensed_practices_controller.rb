class LicensedPracticesController < ApplicationController
  load_and_authorize_resource find_by: :practice_info_id
  
  def show
    jurisdiction_id = params[:jurisdiction_id]

    @req_change = Change.where(jurisdiction_id: jurisdiction_id, practice_info_id: @licensed_practice.practice_info_id, confirmed: false, changed_key: params[:changed_key])[0]
  end
  
end
