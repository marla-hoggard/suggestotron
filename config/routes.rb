Rails.application.routes.draw do
	root 'topics#index' #the page that loads as default
	
	resources :topics do
		collection do
			get 'about'
		end

		member do
			post 'upvote'
			post 'downvote'
		end
	end

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
