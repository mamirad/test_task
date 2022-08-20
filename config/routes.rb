Rails.application.routes.draw do
  root 'shape_infos#index'
  get 'shape_infos/import'
  get 'shape_infos/map'
  namespace :api do
    namespace :v1 do
      get 'shape_infos/index'
    end
  end
end
