Refinery::Core::Engine.routes.append do

  # Admin routes
  namespace :community_posts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :community_posts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
