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
            escape_html("#{data.site.url}#{article.url}")
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

    def read_next_helper
        random_num          = Random.new
        random_post_index   = random_num.rand(0...page_articles.length)
        random_post         = page_articles[random_post_index]

        { 
            url: random_post.url,
            title: random_post.title,
            description: random_post.data.description
        }
    end
end