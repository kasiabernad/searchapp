class Account < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name "bank"
  document_type "account"

  after_save    { IndexWorker.perform_async(:index, self.class.name, self.id) }
  after_destroy { IndexWorker.perform_async(:delete, self.class.name, self.id) }

  mapping do
    indexes :address, type: 'text'
  end
end
