module SearchEngineHelpers
    def title_helper(article = nil)
        if article.nil?
            escape_html(current_page.data.title || data.site.name)
        else
            escape_html(article.title)
        end
    end

    def description_helper
        current_page.data.description || data.site.description
    end

    def permalink_helper(article = nil)
        if article.nil?
            escape_html(data.site.url + current_page.url.gsub("index.html", ""))
        else
            escape_html("#{data.site.url}/#{article.slug}/")
        end
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