Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3000'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete], credentials: true
    end

    # allow do
    #     origins 'https://gamers-vault-frontend-netlify.com'
    #     resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    # end
end