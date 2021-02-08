Rails.application.routes.draw do
  get 'user/show_user'
  get 'welcome/:first_name', to: 'static#welcome'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get '/', to: 'static#welcome'
  get 'gossips', to: 'gossip#list'
  get 'gossips/:gossip_id', to: 'gossip#show_gossip', as: :show_gossip
  get 'users/:user_id', to: 'user#show_user', as: :show_user
end
