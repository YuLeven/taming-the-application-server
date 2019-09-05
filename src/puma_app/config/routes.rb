Rails.application.routes.draw do
  scope 'api' do
    get 'sleeper', to: 'benchmark#sleeper'
    get 'sync_blocker', to: 'benchmark#sync_blocker'
    get 'synchronous_io', to: 'benchmark#synchronous_io'
    get 'concurrent_io', to: 'benchmark#concurrent_io'
    get 'synchronous_active_record', to: 'benchmark#synchronous_active_record'
    get 'concurrent_active_record', to: 'benchmark#concurrent_active_record'
  end
end
