class Account < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name "bank"
  document_type "account"

  after_save    { IndexWorker.perform_async(:index, self.class.name, self.id) }
  after_destroy { IndexWorker.perform_async(:delete, self.class.name, self.id) }

  mapping do
    indexes :address, type: 'text'
    indexes :account_number, type: 'number'
    indexes :age, type: 'number'
    indexes :email, type: 'keyword'
    indexes :account_number, type: 'keyword'
    indexes :balance, type: 'number'
    indexes :employer, type: 'keyword'
    indexes :firstname, type: 'keyword'
    indexes :gender, type: 'keyword'
    indexes :state, type: 'keyword'
  end
end
