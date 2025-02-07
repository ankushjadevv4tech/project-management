class CommentsController < ApplicationController
  before_action :commentable, only: %i[ new create ]
  before_action :comment, only: %i[ edit update destroy ]
  def new
    @comment = commentable.comments.build(comment_params)
  end

  def create
    @comment = commentable.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to project_path(commentable), notice: "Comment created successfully" }
      else
        format.turbo_stream
      end
    end
  end

  def edit
  end

  def update
    comment.update(comment_params)
  end

  def destroy
    comment.destroy
  end

  private

  def commentable
    model = params[:default][:commentable_type].constantize
    if model == Project
      @commentable ||= Project.find(params[:project_id])
    end
  end

  def comment
    @comment ||= Comment.find(params[:id])
  end

  def comment_params
    params.expect(comment: [ :description ])
  end
end
