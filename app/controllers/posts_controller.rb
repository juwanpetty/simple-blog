class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new post_params

        if @post.save
            redirect_to @post, notice: "Your post was saved successfully."
        else
            render 'new', notice: "Your post was not saved successfully."
        end
    end

    def show
    end

    def edit
    end

    def update
        if @post.update post_params
            redirect_to @post, notice: "Your post was updated successfully."
        else
            render 'edit', notice: "Your post was not updated successfully."
        end
    end

    def destroy
        @post.destroy

        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end
