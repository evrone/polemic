class Polemic::CommentsController < Polemic::BaseController
  authorize_resource
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to :back, :notice => I18n.t("polemic.comment.added") }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, :notice => I18n.t("polemic.comment.has_errors") }
      end
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
    if @comment.has_children? # if comment has children, mark as deleted
      @comment.mark_as_deleted!
    else
      @comment.destroy # if no children, destroy it!
    end

    redirect_to @comment.commentable, :notice => I18n.t("polemic.comment.removed")
  end
end
