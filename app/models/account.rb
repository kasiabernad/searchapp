class Account < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name "bank"
  document_type "account"

  mapping do
    indexes :address, type: 'text'
  end
end
