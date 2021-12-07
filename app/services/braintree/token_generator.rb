module Braintree
  class TokenGenerator < Base
    def call
      @gateway.client_token.generate
    end
  end
end
