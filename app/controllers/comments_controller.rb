class CommentsController < ApplicationController
  def create
    change = Change.find(params[:change_id])
    @comment = change.comments.build(content: params[:comment][:content], user_id: current_user.id)
    @comment.save

    respond_to do |format|
      format.js
    end
  end
end
