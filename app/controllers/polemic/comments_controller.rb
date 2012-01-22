class Polemic::CommentsController < Polemic::BaseController
  authorize_resource
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html { redirect_to :back, :notice => I18n.t("polemic.comment.added") }
      # format.js {
      #   render_to_string(:partial => "comments/broadcast")
      #   render :partial => "comments/index", :locals => { :comments => @comment.commentable.includes(:user, :post) }
      # }
    end
  end
  
  # def index
  #   @comments = Comment.where(:commentable_id => params[:commentable_id], :commentable_type => params[:commentable_type])
  #   respond_to do |format|
  #     format.json { render :json => @comments }
  #     format.html {
  #       render @comments #:partial => "comments/index", :locals => { :comments => @post.comments.includes(:user, :post) }
  #     }
  #   end
  # end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.has_children?
      # if has children, mark as deleted
      @comment.mark_as_deleted!
    else
      # if no children, destroying
      @comment.destroy
    end

    redirect_to @comment.commentable, :notice => I18n.t("polemic.comment.removed")
  end
end
