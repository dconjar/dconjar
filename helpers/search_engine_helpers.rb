module SearchEngineHelpers
    def title_helper
        current_page.data.title || data.site.name
    end

    def description_helper
        current_page.data.description || data.site.description
    end

    def permalink_helper
        data.site.url + current_page.url.gsub("index.html", "")
    end

    def image_helper
        current_page.data.image || nil
    end

    def rss_link_helper
        data.site.url + '/feed.xml'
    end

    def site_name_helper
        data.site.name
    end

    def sitemap_entry_helper(page)
        data.site.url + '/' + page.destination_path.gsub('index.html', '')
    end
end