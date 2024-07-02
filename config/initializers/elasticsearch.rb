require 'elasticsearch/model'

# Elasticsearch::Model.client = Elasticsearch::Client.new(url: "http://#{ENV.fetch("ELASTICSEARCH_HOST")}:9200")

Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: "http://#{ENV.fetch("ELASTICSEARCH_HOST")}:9200",  
  log: true,
  retry_on_failure: true,
  transport_options: {
    request: { timeout: 5 }
  }
)