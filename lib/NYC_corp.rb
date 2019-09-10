require_relative "./NYC_corp/version"
require_relative "./NYC_corp/company"
require_relative "./NYC_corp/scraper"
require_relative "./NYC_corp/cli"

require "colorize"
require 'nokogiri'
require 'open-uri'
require 'pry'

module NYCCorp
  class Error < StandardError; end
  
end
