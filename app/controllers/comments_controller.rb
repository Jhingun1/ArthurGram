class CommentsController < ApplicationController
before_action :set_post

    def create
      @comment = @post.comments.new(comment_params)
      @comment.user_id = current_user.id


      if @comment.save
        flash[:success] = "Comment succesfully created."
        respond_to do |format|
        format.html { redirect_to post_index_path }
        format.js
        end
      else
        flash[:alert] = "Check the comment form, something went horribly wrong."
        respond_to do |format|
        format.html { redirect_to post_index_path }
        format.js
        end
      end
    end


    def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:alert] = "Comment Deleted."
    redirect_to post_index_path
    end

  private

  def comment_params
  params.require(:comment).permit(:content)
  end

  def set_post
  @post = Post.find(params[:post_id])
  end




end
