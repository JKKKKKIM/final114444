class CommentController < ApplicationController
    before_action :authenticate_user!
    
    def reply_create
    
        oneComment = Reply.new
        oneComment.editor = params[:reply_editor]
        oneComment.content = params[:reply_content]
        oneComment.postId = params[:post_id]
        post_id =  params[:post_id]
        oneComment.save
        redirect_to '/show/' + post_id
        
    end
    
    def reply_delete
        
        reply_delete = Reply.find(params[:reply_id])
        post_id =  params[:post_id]
        reply_delete.destroy
        redirect_to '/show/' + post_id
        
        
    end
end
