require_relative '../lib/transaction'

RSpec.describe Transaction do 
    it 'Creates a transaction and returns the correect amount' do
        transaction = Transaction.new(500)
        expect(transaction.show_amount).to eq (500)
    end

end