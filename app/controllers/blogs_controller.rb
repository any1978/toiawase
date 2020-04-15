


class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end

    def new
      # 追記する
      @blog = Blog.new
    end

    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
            redirect_to blogs_path, notice: "ブログを作成しました！"
          else
            # 入力フォームを再描画します。
            render :new
          end
    end

    # def show
    #     redirect_to new_blog_path
    # end

    private
    def blog_params
      params.require(:blog).permit(:name, :email, :content)
    end
    
end
