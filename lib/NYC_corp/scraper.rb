class NYCCorp::Scraper 

    def self.scrape 
        site = "https://www.indeed.com/cmp?l=New+York%2C+NY"
        page = Nokogiri::HTML(open(site))
        doc = page.css("div.clearfix.cmp-CompanyWidget")
    end

end