#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/comparison'

# standardise parties
class Comparison < EveryPoliticianScraper::Comparison
  REMAP = {
    'Șor Party' => 'Fracțiunea parlamentară a Partidului Politic "ȘOR"',
    'Electoral Bloc of Communists and Socialists' => 'Fracțiunea parlamentară a Blocului Comuniștilor și Socialiștilor',
    'Party of Action and Solidarity' => 'Fracțiunea parlamentară "Partidul Acțiune și Solidaritate"'
  }.freeze

  def wikidata_csv_options
    { converters: [->(val) { REMAP.fetch(val, val) }] }
  end
end

diff = Comparison.new('data/wikidata.csv', 'data/official.csv').diff
puts diff.sort_by { |r| [r.first, r.last.to_s] }.reverse.map(&:to_csv)
