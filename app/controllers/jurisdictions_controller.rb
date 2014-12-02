class JurisdictionsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @jurisdictions.map &:set_attribute_keys
    @changes=Change.accessible_by current_ability

    respond_to do |format|
      format.html # go to view
      format.json { render json: (@jurisdictions.map &:attribute_keys) }
    end
  end

  def show
    @jurisdiction.set_attribute_keys
    respond_to do |fmt|
      fmt.html # go to view
      fmt.json {render json: (@jurisdiction.attribute_keys)}
    end
  end

  def edit
  end
  
  def suggest_draft
    attr_key = params[:attribute_key].to_sym
    if !params[:val].nil? and !params[:practice_title].nil? and @jurisdiction.has_practice?(params[:practice_title]) and
      Jurisdiction.has_attribute_key? attr_key
      
      if @jurisdiction.reverse_map_attribute_key params[:practice_title], attr_key, params[:val], 'draft'
        respond_to do |fmt|
          fmt.html {redirect_to Change.last, notice: 'Draft suggestion added'}
          fmt.json {render json: {'status' => 'success'}}
        end
      else
        respond_to do |fmt|
          fmt.html {render 'edit', notice: @jurisdiction.errors}
          fmt.json {render json: {'status' => @jurisdiction.errors}}
        end
      end
    else
      go_back_or_root("#{@jurisdiction.has_practice?(params[:practice_title])}")
    end
  end
end
