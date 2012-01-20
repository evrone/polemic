class BlahBlahBlah::CommentsController < ApplicationController
  authorize_resource
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html { redirect_to @comment.commentable }
      format.js {
        render_to_string(:partial => "comments/broadcast")
        render :partial => "comments/index", :locals => { :comments => @comment.commentable.includes(:user, :post) }
      }
    end
  end
  
  def index
    @comments = Comment.where(:commentable_id => params[:commentable_id], :commentable_type => params[:commentable_type])
    respond_to do |format|
      format.json { render :json => @comments }
      format.html {
        render @comments #:partial => "comments/index", :locals => { :comments => @post.comments.includes(:user, :post) }
      }
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.has_children?
      # есть дети - помечаем удаленным
      @comment.deleted = true
      @comment.save
    else
      # нет детей - сносим нах
      @comment.destroy
    end

    redirect_to @comment.post, :notice => "Комментарий успешно удален."
  end
end
