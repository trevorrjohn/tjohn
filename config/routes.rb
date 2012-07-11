TrevorJohn::Application.routes.draw do
  get "pages/contact"

  root :to => 'pages#index'
end
