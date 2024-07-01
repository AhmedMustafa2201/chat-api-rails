require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: "http://#{ENV.fetch("ELASTICSEARCH_HOST")}:9200",
  log: true,
  retry_on_failure: true,
  reload_connections: true,
  transport_options: {
    request: { timeout: 5 }
  }
)

retry_attempts = 5
begin
  Elasticsearch::Model.client.cluster.health
rescue Faraday::ConnectionFailed => e
  retry_attempts -= 1
  if retry_attempts > 0
    sleep 5
    retry
  else
    raise e
  end
end
