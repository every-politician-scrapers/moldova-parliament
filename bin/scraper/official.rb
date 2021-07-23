#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'open-uri/cached'

class Legislature
  # details for an individual member
  class Member < Scraped::HTML
    field :id do
      url[%r{Id/(\d+)/}, 1]
    end

    # Reverse the order
    field :name do
      display_name.split(' ', 2).reverse.join(' ')
    end

    field :faction_id do
      noko.css('a.FractionLink/@href').text[%r{Id/(\d+)/}, 1]
    end

    field :faction do
      noko.css('a.FractionLink').text.tidy
    end

    private

    def display_name
      noko.css('a.MemberLink').text.tidy
    end

    def url
      noko.css('a.MemberLink/@href').text
    end
  end

  # The page listing all the members
  class Members < Scraped::HTML
    field :members do
      member_list.sort_by { |member| member[:id].to_s.to_i }
    end

    private

    def member_container
      noko.css('#dnn_ctr476_ModuleContent').xpath('.//tr[td[2]]')
    end

    def member_list
      member_container.map { |member| fragment(member => Member).to_h }
    end
  end
end

url = 'http://www.parlament.md/StructuraParlamentului/Deputa%C8%9Bii/tabid/87/language/en-US/Default.aspx'
puts EveryPoliticianScraper::ScraperData.new(url).csv
