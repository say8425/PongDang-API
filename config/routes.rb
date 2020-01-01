# frozen_string_literal: true

Jets.application.routes.draw do
  root  'degrees#index'
  get   'degrees',        to: 'degrees#index'
  get   'degrees/index',  to: 'degrees#index'
  any   '*catchall',      to: 'jets/public#show'
end
