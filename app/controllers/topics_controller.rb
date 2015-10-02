class TopicsController < ApplicationController
	def index
		@topic = Topic.order(created_at: :desc)
		@newTopic = Topic.new
	end

	def show
		@newTopic = Topic.new
		@topic = Topic.find(params[:id])
		@topic.view+=1
		@topic.save
	end

	def new
		@newTopic = Topic.new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(topic_params_post)
		@topic.view = @topic.comment = @topic.like = 0
		if @topic.save
			redirect_to @topic
		else
			render 'new'
		end
	end

	def edit	
	
	end

	def update
		@topic = Topic.find(params[:id])
		@topic.title = topic_params[:title]
		@topic.save
		redirect_to @topic
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
		redirect_to topics_path
	end
	private
	def topic_params
		params.require(:topic)
	end
	def topic_params_post
		params.require(:topic).permit(:image, :title)
	end
end
