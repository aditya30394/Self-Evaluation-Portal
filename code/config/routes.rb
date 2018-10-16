Rails.application.routes.draw do
  
  get 'topics/new'

  resources :instructors
  resources :topics
  resources :problems

  get '/help',  to: 'static_pages#help'
  get '/about',  to: 'static_pages#about'
  get  '/contact',  to: 'static_pages#contact'
  get  '/signup',  to: 'instructors#activate'
  post  '/signup',  to: 'instructors#update_activate'
  patch  '/signup',  to: 'instructors#update_activate'
  get  '/create_instructor',  to: 'instructors#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/new_topic', to: 'topics#new'
  get '/new_problem', to: 'problems#new'
  # post '/new_topic', to: 'topics#create'


  get '/quiz', to: 'problem_displays#quiz'
  post '/quiz', to: 'problem_displays#selected'


  get '/quiz_problem', to: 'problem_displays#quiz_problem'
  post '/quiz_problem', to: 'problem_displays#save_answer'
  get '/quiz_problem_answer', to: 'problem_displays#quiz_problem_answer'
  get '/quiz_flashcard_question', to: 'problem_displays#quiz_flashcard_question'
  get '/quiz_flashcard_answer', to: 'problem_displays#quiz_flashcard_answer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
