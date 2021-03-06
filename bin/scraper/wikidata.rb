#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/wikidata_query'

query = <<SPARQL
  SELECT (STRAFTER(STR(?member), STR(wd:)) AS ?item) ?name ?faction
    (STRAFTER(STR(?ps), '/statement/') AS ?psid)
  WHERE {
    ?member p:P39 ?ps .
    ?ps ps:P39 wd:Q18390049 ; pq:P2937 wd:Q107651615 .
    FILTER NOT EXISTS { ?ps pq:P582 ?end }
    OPTIONAL {
      ?ps pq:P4100 ?group .
      OPTIONAL { ?group rdfs:label ?faction FILTER(LANG(?faction) = "en") }
    }

    OPTIONAL { ?ps prov:wasDerivedFrom/pr:P1810 ?sourceName }
    OPTIONAL { ?member rdfs:label ?enLabel FILTER(LANG(?enLabel) = "en") }
    BIND(COALESCE(?sourceName, ?enLabel) AS ?name)
  }
  ORDER BY ?name
SPARQL

agent = 'every-politican-scrapers/moldova-parliament'
puts EveryPoliticianScraper::WikidataQuery.new(query, agent).csv
