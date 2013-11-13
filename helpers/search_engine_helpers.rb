module SearchEngineHelpers
    def title_helper(article = nil)
        if article.nil?
            if current_page.data.title.nil?
                data.site.name
            else
                escape_html(current_page.data.title)
            end
        else
            escape_html(article.title)
        end
    end

    def description_helper
        escape_html(current_page.data.description.to_s) || escape_html(data.site.description)
    end

    def permalink_helper(article = nil)
        if article.nil?
            data.site.url + current_page.url.gsub("index.html", "")
        else
            "#{data.site.url}#{article.url}"
        end
    end

    def image_helper
        data.site.url + '/images/' + current_page.data.image.to_s || nil
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
        def get_random_post
            random_num          = Random.new
            random_post_index   = random_num.rand(0...page_articles.length)
            random_post         = page_articles[random_post_index]

            if random_post.url == current_page.url
                get_random_post
            else
                random_post
            end
        end

        random_post = get_random_post

        { 
            url: random_post.url,
            title: random_post.title,
            description: random_post.data.description
        }
    end
end