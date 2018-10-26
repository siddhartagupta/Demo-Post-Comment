class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @commentable = find_commentable
        @comment = @commentable.comments.build comment_params
        @comment.save
            redirect_to @commentable, notice: "Your comment was successfully posted."
    end

    def find_commentable
      params.each do |name, value|
          if name =~ /(.+)_id$/
              return $1.classify.constantize.find(value)
          end
      end
    end
    private

        def comment_params
            params.require(:comment).permit(:name,:body)
        end

end