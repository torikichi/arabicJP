Rails.application.routes.draw do
  get 'lessons/home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'lessons#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # 類義語/対義語サブウィンドウ
  get 'relations/synsub'
  get 'relations/antosub'

  get 'words/opn_words_to_lesson'
  post 'words/opn_words_to_lesson'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :product
  #
  # 自分で追加した分
    resources :lessons do
      member do
        get :word_in_lessons
      end
    end

    resource :lessons
    resources :relations do
      member do
        get :synonym, :antonym, :add_synonym, :edit_antonym
        post :entry_antonym
      end
    end

    resources :words do
      member do
        get :wordsRoots, :lesson_in_words, :srch_words_to_lesson
        post :srch_words_to_lesson
      end

      resources :examples
    end

    resources :examples

    resources :users

    resources :appearances do
      member do
        get :add_word_to_lesson, :get_lesson_list
        post :get_lesson_list
      end
    end

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
  #

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
