# Ruby on Rails and Elasticsearch: Example application

This application is an example of integrating the {Elasticsearch}[http://www.elasticsearch.org]
search engine with the {Ruby On Rails}[http://rubyonrails.org] web framework.

It has been generated by application templates available at
https://github.com/elasticsearch/elasticsearch-rails/tree/master/elasticsearch-rails/lib/rails/templates.

## [1] Basic

The `basic` version provides a simple integration for a simple Rails model, `Article`, showing how
to include the search engine support in your model, automatically index changes to records,
and use a form to perform simple search require 'requests.'


## [2] Usage

Download this json [https://download.elastic.co/demos/kibana/gettingstarted/accounts.zip] and bulk it to your elasticsearch
```
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/bank/account/_bulk?pretty' --data-binary @accounts.json
```

You can visit `localhost:3000/accounts` and see results fetched from elsaticsearch.
