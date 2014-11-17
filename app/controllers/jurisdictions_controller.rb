class JurisdictionsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @jurisdictions.map &:set_attribute_keys
    
    respond_to do |format|
      format.html # go to view
      format.json { render json: (@jurisdictions.map &:attribute_keys) }
    end
  end
end
