class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_parameter)
    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      @prototype = @comment.prototype
      render "prototypes/show"
    end
  end

  private

  def comment_parameter
    params.require(:comment).permit(:content).merge( user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
