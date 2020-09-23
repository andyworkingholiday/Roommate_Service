Rails.application.routes.draw do
    
  
  #마이페이지 라우트
  # get '/choice/write/:current_user_id' => 'choice#write'
  
  get '/mypage/index/:current_user_id' => 'mypage#index', :as => :mypage_index
  post 'mypage/profile'
  
  
  
  
  #성향 업데이트 및 올리기
  get 'mypage/type_index'
  get 'mypage/type_index2'
  
  post 'mypage/type_update'
  post 'mypage/type_update2'
  
  get 'mypage/type_edit'
  get 'mypage/type_edit2'
  
  post 'mypage/create'
  post 'mypage/create2'
  
  #마이페이지 밑에 네비게이션바(룸메 신성 관리 /삭제 /보기/ 쪽지함 )
  get 'mypage/my_propose'
  get 'mypage/propose_cancel'
  get 'mypage/other_propose'
  get 'mypage/propose_reject'
  get 'mypage/propose_success'
  
  
  
  
  #기본적인 인적사항 만들기
  get 'mypage/core_index'
  post 'mypage/core_create'
  post 'mypage/core_edit'
  get 'mypage/core_update'
  
  
  

  
  
  #핵심 네브바, 유형별로 탐색하는 거
  root 'main#home'
  get'main/home'
  get 'main/haveroom'
  get 'main/nhaveroom'
  get 'main/school'
  get 'main/detail_button'
  
  # 질문 있어요
  post 'main/comment_create'
  get '/main/destroy/:id' => 'main#destroy'

  #룸메 신청하기
  post 'main/propose'
  
  #작성한 글 올리고, 내리고
  post 'main/expose'
  post 'main/un_expose'
  
  #문석형이 작업한 라우트
  get 'upload/index'
  get 'upload/write'
  post 'upload/create'
  
  #쪽지 라우트 
  get 'mypage/all_chat'
  get 'chat/:user_id' => 'mypage#chat'  
  post 'chat/:user_id/mypage/message' => 'mypage#message' 
  get 'mypage/receipt'
  get 'mypage/sendmessage'
  
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
