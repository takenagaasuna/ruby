class PostsController < ApplicationController
    
    def index
        @posts=Post.all.order(created_at: 'desc')
    end
    
    def show
        @post=Post.find(params[:id])
    end
    
    def new
    end
    def create
        #render plain: params[:post].inspect
        @post = Post.new(post_params)
        if @post.save
            redirent_to posts_path
        else
            render plain: @post.errors.inspect
        end
    end
    
    private
        def post_params
            params.require(:post).permit(:title,:body)
    end
    
end
