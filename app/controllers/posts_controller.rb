class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:blogger_id, :destination_id, :likes, :content, :title)
    end
end
