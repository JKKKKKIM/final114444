class BoardController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.all
  end
  
  def new
    
  end
  
  def create
    
    create_post = Post.new
    create_post.editor = params[:editor]
    create_post.title = params[:title]
    create_post.content = params[:content]

    uploader = UploadImageUploader.new
    
    uploader.store!(params[:inputUrl])

    flash[:notice] = ""
    create_post.image_url = uploader

    create_post.save
    redirect_to '/'

  
  end  
  
  def show
    
    @replies = Reply.where(:postId => params[:post_id])
    
    @show_post = Post.find(params[:post_id])
  end
  
  def edit
    @edit_post = Post.find(params[:post_id])
  end
  
   
     
  def update
    
    upd_post = Post.find(params[:post_id])
    upd_post.title = params[:title]
    upd_post.editor = params[:editor]
    upd_post.content = params[:content]
    upd_post.save
    redirect_to '/'
    
  end
  
  def delete
    
    del_post = Post.find(params[:post_id])
    del_post.destroy
    redirect_to '/'
    
  end
  
  
end
