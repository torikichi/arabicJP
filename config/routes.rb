Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :password_resets

  get 'lessons/home'
  
  root 'lessons#home'
  
  # 類義語/対義語サブウィンドウ
  get 'relations/synsub'
  get 'relations/antosub'
  
  get 'appearances/srch_words_to_lesson'
  post 'appearances/srch_words_to_lesson'
  
  # sorcery対応 --start--
  resources :sessions
  resources :users do
    member do
      get :activate
    end    
  end
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
  # sorcery対応 --end--
  
  resources :versions, only: [:index, :show]
  
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
      get :words_roots, :plural_from_singular, :lesson_in_words, :vocabulary_book
    end

    resources :examples
  end

  resources :examples

  resources :appearances do
    member do
      get :add_word_to_lesson, :get_lesson_list
      post :get_lesson_list
    end
  end
end
