Rails.application.routes.draw do
	root 'topics#index' #the page that loads as default
	resources :topics do
		member do
			post 'upvote'
		end
	end

	resources :topics do
		member do
			post 'downvote'
		end
	end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
