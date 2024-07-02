require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new(url: "http://#{ENV.fetch("ELASTICSEARCH_HOST")}:9200")
