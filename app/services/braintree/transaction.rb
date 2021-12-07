module Braintree
  class Transaction < Base
    def call(amount: 0, nonce: nil)
      raise 'Transaction fail' if nonce.nil? or amount <= 0

      @gateway.transaction.sale(
        amount: amount,
        payment_method_nonce: nonce
      )
    end
  end
end
