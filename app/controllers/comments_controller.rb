class CommentsController < ApplicationController
	def index
	end

	def new
	end

	def create
		comment = Comment.new(content: comment_params[:content],
									topic_id: params[:topic_id],
									user_id: current_user.id)
		if comment.save
			redirect_to topic_path(params[:topic_id])
		else
			flash[:warning] = "Something happen. Try again!"
			redirect_to topic_path(params[:topic_id])
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
