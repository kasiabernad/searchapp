class IndexWorker < BaseWorker
  sidekiq_options queue: 'elasticsearch', retry: false

  Logger = Sidekiq.logger.level == Logger::DEBUG ? Sidekiq.logger : nil
  Client = Elasticsearch::Client.new(host: 'localhost:9200', logger: Logger)

  def perform(operation, record_type, record_id)
    logger.debug [operation, "ID: #{record_id}"]

    case operation.to_s
    when /index/ then index(record_type, record_id)
    when /delete/ then delete(record_type, record_id)
    else raise ArgumentError, "Unknown operation '#{operation}'"
    end
  rescue Elasticsearch::Transport::Transport::Errors::NotFound
    logger.debug "#{record_type.upcase} not found, ID: #{record_id}"
  end

  private

  def index(record_type, record_id)
    logger.debug [record_type]
    record = record_type.constantize.find(record_id)

    Client.index(
      index: record_type.downcase.pluralize,
      id: record_id,
      body: record.__elasticsearch__.as_indexed_json
    )
  end

  def delete(record_type, record_id)
    Client.delete(
      index: record_type.downcase.pluralize,
      id: record_id
    )
  end
end
