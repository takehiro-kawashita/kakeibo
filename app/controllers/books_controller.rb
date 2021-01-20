class BooksController < ApplicationController
    
    before_action :set_book,only:[:show,:edit,:update,:destroy]
    
    def index
        @books = Book.all #家計簿データをすべて取得(allメソッド)
        @books = @books.where(year: params[:year]) if params[:year].present?
        @books = @books.where(month: params[:month]) if params[:month].present?
    end
    
    def show
    end
    
    def new
        @book = Book.new
        @book.year = 2021
    end
    
    def create
        book_params = params.require(:book).permit(:year,:month,:inout,:category,:amount)
        #ストロングパラメータで登録に必要なデータを取り出す。
        @book = Book.new(book_params)
        #データをインスタンス化して@bookに格納する。
        if @book.save
            flash[:notice] = "家計簿にデータを１件登録しました。"
            redirect_to books_path
            
        #データを.saveメソッドでセーブしたら一覧画面に移るn
        else
            flash.now[:alert] = "登録に失敗しました。"
            render :new
        #バリデーションがfalse(未入力項目あり)の時新しい新規作成画面を表示する
        end
    end
    
    def edit
    end
    
    def update
        book_params = params.require(:book).permit(:year,:month,:inout,:category,:amount)
        if @book.update(book_params)
            flash[:notice] = "データを１件更新しました。"
            redirect_to books_path
             #データを.updateメソッドで更新したら一覧画面に移る
        else
            flash.now[:alert] = "更新に失敗しました。"
            render :edit
            #バリデーションがfalse(未入力項目あり)の時新しい更新画面を表示する
        end
    end
    
    def destroy
        @book.destroy#.destroyメソッドでデータを削除する。
        flash[:notice] = "削除しました。"
        redirect_to books_path#一覧画面に移る
    end
    
    def set_book
        @book = Book.find(params[:id])
    end
end