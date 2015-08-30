Rails.application.routes.draw do

  use_doorkeeper
  mount Uook::API => '/'
end
