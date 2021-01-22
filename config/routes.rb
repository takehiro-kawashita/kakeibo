Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/books", to:"books#index"#一覧ページ（index）を得るコード
  # #(URLとGETのHTTPメソッドのリクエストがきたらbooks_controllerのindexアクション実行)
  # post "/books", to:"books#create"#URLとPOSTのHTTPメソッドのリクエストがきたらbooks_controllerのcreateメソッドを実行
  # get "/books/new",to:"books#new",as:"new_book" #リクエストがきたらbooks_controllerのnewメソッドを実行
  # get "/books/:id/edit",to:"books#edit",as:"edit_book"#リクエストがきたらbooks_controllerのeditメソッドを実行
  # get "/books/:id",to:"books#show",as:"book" #リクエストがきたらbooks_controllerのshowメソッドを実行
  # patch "/books/:id",to:"books#update"#URLとpatchのHTTPメソッドがきたら、books_controllerのupdateメソッドを実行
  # delete "/books/:id",to:"books#destroy"#URLとdeleteのHTTPメソッドがきたら、books_controllerのdeleteメソッドを実行
  
  resources :books
  
  get "/signup",to: "users#new"
  post "/signup",to: "users#create"
  get "/signin",to: "session#new"
  post "/signin",to: "session#create"
  get "/signout",to: "session#destroy"
  
end
