module Braintree
  class Base < ApplicationService
    def initialize(mode: 'sandbox', merchant_id: nil, public_key: nil, private_key: nil)
      @merchant_id = merchant_id || ENV['braintree_merchant_id']
      @public_key = public_key || ENV['braintree_public_key']
      @private_key = private_key || ENV['braintree_private_key']
      @gateway = Braintree::Gateway.new(
        environment: mode,
        merchant_id: @merchant_id,
        public_key: @public_key,
        private_key: @private_key
      )
    end
  end
end
