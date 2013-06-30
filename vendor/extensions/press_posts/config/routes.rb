Refinery::Core::Engine.routes.append do

  # Admin routes
  namespace :press_posts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :press_posts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
