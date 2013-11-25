---
title: "Site Speed Secrets: How I Made My Blog Faster Than 99% of Websites"
description: "On average, this site now loads in under half a second from most places in the world. Your site can be just as fast. Here are the steps I took to achieve this massive speed boost."
---

> On average, **this site now loads in under half a second** from most places in the world. Your site can be just as fast, but it requires some out-of-the-box thinking.

Site speed matters. A lot. If you increase your website's page load speed by **50%**, **100%**, or (in my case) **640%**, good things will happen:

* **Your bounce rate will drop**. [A study by Akamai][0] found that 40% of shoppers bounce by the third second of loading. People are far less likely to hit the back button when the site loads instantly.
* **Your engagement metrics will improve**. If your site takes more than a couple seconds to load, [visitors will view far less pages per visit][6].
* **Your conversion rate will increase**. In [a survey of 60,000 consumers][9], 8% cited slow landing pages as a reasoning for abandoning their purchase.
* **Your web traffic will increase**. Site speed is a [known Google ranking factor][7], and there seems to be a [correlation between server latency and Google ranking][8].

How mere mortals boost their site speed
---------------------------------------

There are many tried-and-true techniques for improving website performance.

Your styles and javascripts can be combined into one CSS file and one JavaScript file, reducing the number of requests made to the server.

Those two files can then be minified — crammed down into big blobs of CSS and JavaScript, with all the spaces and newlines and comments removed.

**You can take it a step further and compress the two files**. Turn your `styles.min.css` file into a `styles.min.css.gz` file. This is equivalent to reducing the size of a large file (or collection of files) by turning it into a zip archive.

Images, which are often the largest assets on a webpage, can be substantially reduced in size by using a decent image optimization utility. [Imageoptim][1] and [JPEGmini][2] come to mind.

Choosing appropriate file types, like JPEG for photos and PNG for transparency, can also make a big difference.

A better way to deliver content
-------------------------------

To put the icing on the cake, you can take those ruthlessly-optimized static files — your styles, javascripts and images — and serve them through a content delivery network, or CDN.

**CDNs put your static files on servers all over the world**.

When old Harriet Mandelbaum loads your webpage in the Netherlands, her request gets routed to a server in the Netherlands.

The files are much closer to her, so they load much faster!

When Albert Augustyniak goes to your website from his laptop in a New York coffee shop, he has the same pleasant experience that Ms. Mandelbaum has in the Netherlands. 

It loads just as fast because his browser is loading files from a server in New York.

Location, location, location.

![How CDNs work](how-cdns-work.jpg)

This may all seem complicated, and it is. But it's trivially easy to set up when you use the right tools. 

It's easy because we're dealing with static assets, like CSS, JavaScript, and images. When we start dealing with dynamic content, well...

This is where it really gets complicated
----------------------------------------

Every time a webpage loads, two things happen:

1. The client sends a [request][3] to the server
2. The server sends static content to the client

When the client requests a static file, the server's job is very easy. It simply sends the static file to the client. Easy peasy.

But sometimes the client requests something *dynamic*. **"Dynamic" means that the static content being requested doesn't exist**. Code needs to be executed on the server to create the static file and send it back to the client.

WordPress, the content management system that [powers 18.9% of the internet][10], is dynamic. 

Here's what happens when Harriet Mandelbaum tries to load your WordPress site:

* Ms. Mandelbaum goes to your URL in her browser
* This sends a `GET` request to your server
* The server loads your `index.php` file
* Your `index.php` file loads your `wp-blog-header.php` file
* Your `wp-blog-header.php` loads your `wp-config.php` file
* Your `wp-config.php` file loads your `wp-settings.php` file
* Your `wp-settings.php` file loads 17 files from your `wp-includes` directory, along with your plugins, which may contain tens or hundreds of additional PHP files

Your server has to do all that work just to send some HTML code to Harriet's web browser! Oh, and I forgot to mention that many of those PHP files are querying a database.

Fighting complicated with more complicated
------------------------------------------

Dynamic content is slow. But there's a way to make it much, much faster.

It's called *caching*.

Caching is the process of saving dynamic webpages to your server as static HTML files.

Instead of loading all those PHP files listed above and eventually rendering a webpage, your server simply pulls the HTML of the page from your cache.

You can enable caching in WordPress by installing the [W3 Total Cache Plugin][4]. It supports CDN integration, asset minification, page caching, database caching, and various other speed-boosters.

But even with all the caching in the world, you'll have a tough time competing with the raw speed of truly static files. Your server still needs to do the work of routing requests to the appropriate cached page. 

And that's not the only caveat...

WordPress is a hugely complex piece of software, and caching makes it more so.

If you've ever used W3 Total Cache, you know what I'm talking about.

Hundreds of options, and it's never clear how they'll impact your site speed. It depends on your server configuration. And your choice of CDN. And your database object caching strategy.

And about a million other things.

Rockets are easier to configure than caching plugins. And they say rocket science is hard.

> "There are only two hard things in Computer Science: cache invalidation and naming things." — Phil Karlton

The problem with complexity
---------------------------

Complexity is a killer. **Complex systems tend to be less secure, harder to understand, and more prone to breakage than simpler systems**.

I know all about breakage. This blog was once powered by WordPress. And cached by W3 Total Cache. Then one day, it broke.

The server was running smooth, but the site was down. I couldn't even access the admin panel. Not fun.

I fixed it by removing all traces of W3 Total Cache.

This was just one of many occasions in which I've had to fix "broken" CMS-powered websites. And it's all because of complexity.

Rethinking content management
-----------------------------

When we use complex content management systems and web frameworks, we're willing to accept the complexity. We assume that the benefits outweigh the cons.

For a long time, they did. I graduated from building websites with static HTML in 2005. Content management systems were complex. But they were better than the alternative. I moved on, just like everyone else.

Content management systems offered many advantages:

* **Content management**. Non-technical people could manage web content. No need to learn HTML (until the WYSIWYG editor does something unexpected).
* **Less code duplication**. Instead of duplicating your header and footer HTML code in every file, you create templates.
* **A community**. Big CMS systems led to the rise of "CMS developers." When your WordPress site breaks, it's not hard to find someone who can fix it.
* **A standardized way of doing things**. CMS developers come up with better techniques for getting things done, and the entire community benefits.
* **Code sharing**. Many CMS systems are plug-and-play. You can extend them with plugins. No need to reinvent the wheel.

For eight years, I built websites with WordPress and Joomla. And I didn't look back. Until now.

Static HTML is the future (and the past)
----------------------------------------

I see two major trends happening in web development right now:

1. The rising popularity of JavaScript
2. The rising popularity of static HTML

Everyone's talking about the first trend. But the second trend has gone under the radar outside of developer circles.

It all started in 2008, when GitHub-cofounder Tom Preston-Werner [released Jekyll][11].

Jekyll is a simple, blog-aware static site generator. It takes template files, Markdown files and custom data and transforms them into a speedy static site.

No caching. No backend. No security vulnerabilities. No complexity.

Just static HTML.

Since Jekyll entered the scene, [over eighty static site generators have been released][18]. Journo, Ruhoh, Second Crack, Kerouac, Pelican, Nanoc...

And my personal favorite, [Middleman][12].

Anything dynamic can do, static can do better
---------------------------------------------

Middleman is written in Ruby. It takes the best parts of Rails and Padrino and combines them into a simple yet powerful system for building static websites.

**It provides all the benefits of CMS, with none of the bloat**:

* **Content management**. I write my blog posts in [Markdown][17]. If you need a WYSIWYG editor, [Prose.io][13] is a great one. It integrates with GitHub, so collaborating with multiple authors is painless.
* **Less code duplication**. Middleman ships with [Tilt][14] and the [Rails Asset Pipeline][15]. It gives you all the best tools for development. Once you've built your first Middleman template, you'll dread returning to WordPress or Drupal.
* **A community**. Middleman is the only static site generator I know of that has a [community forum][15].
* **A standardized way of doing things**. Rails developers feel right at home with Middleman. And we all know that Ruby on Rails is all about convention over configuration!
* **Code sharing**. Middleman can be extended with [plugins][16].

**Middleman is also really good at site speed optimization**:

* It makes it easy to combine all your styles and JavaScripts into single CSS and JS files.
* It automatically minifies your CSS and JavaScript files.
* There are extensions for compressing assets, minifying HTML, and reducing the size of images
* You can configure it to automatically deploy to Amazon CloudFront whenever you type `middleman build` in your terminal. **This means that you can serve your entire website from a CDN**!

When I rebuilt this blog for the 80-millionth time, I decided to use Middleman. It did not let me down.

The results speak for themselves
--------------------------------

According to Pingdom, this blog loads faster than 99% of websites:

![My blog loads faster than 99% of websites](site-speed.png)
<p class="caption">According to <a href="http://tools.pingdom.com/fpt/#!/dEE9aL/http://www.derekconjar.com">Pingdom's famous website speed test</a>, this site is in the 1%.</p>

That was tested from New York, but it's giving me the same results when I test it from Texas and the Netherlands. It even loads quickly for old Harriet Mandelbaum!

How to join the 1%
------------------

Here's a quick rundown of everything I did to make my blog blazing fast:

* I removed all the CSS and JavaScript code that wasn't being used (most of Twitter Bootstrap)
* I combined my nine JavaScript files and 38 SCSS files into one JavaScript file and one CSS file using Sprockets and Sass.
* I configured Middleman to minify and compress those files.
* I configured Middleman to minify and compress my HTML files.
* I set up automatic image optimization with the [middleman-imageoptim][19] extension.
* I lazy-load images, Disqus comments, and Google Custom Search using jQuery.
* I used [an icon font][20] to create my own social sharing buttons, instead of loading assets from Twitter, Facebook, and Google+.
* I configured the site to deploy to Amazon CloudFront when when I type `middleman build` using the [middleman-s3_sync][21] extension.

If you want to see exactly how I did all that, you can [inspect my code on GitHub][22].

I'm working on an e-book that explains in detail how to optimize your site speed with Middleman.

**The book will cover lots of other important stuff about building lightning-fast static sites**:

* How to optimize your static site for search engines
* How to add comments and social sharing buttons
* How to make it easy for non-nerds to manage content
* How to use the Asset Pipeline, Sass and Bootstrap to rapidly build ambitious websites
* Common mistakes people make when setting up Amazon Cloudfront, and how to avoid them

If you're interested, sign up for my mailing list below. I'll send you an email update when the e-book is finished.

I'll also make sure that you get a 25% discount just for signing up early.

[0]: http://www.akamai.com/html/about/press/releases/2009/press_091409.html
[1]: http://imageoptim.com/
[2]: http://www.jpegmini.com/
[3]: http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol
[4]: http://wordpress.org/plugins/w3-total-cache/
[5]: http://takingpitches.com/2012/09/22/elon-musk-the-role-of-analogy-and-reasoning-from-first-principles-in-disruptive-entrepreneurship/
[6]: http://torbit.com/blog/2012/08/28/how-site-speed-affects-your-user-engagement/
[7]: http://searchengineland.com/google-now-counts-site-speed-as-ranking-factor-39708
[8]: http://moz.com/blog/how-website-speed-actually-impacts-search-ranking
[9]: http://econsultancy.com/us/blog/9790-slow-loading-websites-cost-retailers-1-73bn-in-lost-sales-each-year
[10]: http://thenextweb.com/insider/2013/07/27/wordpress-now-powers-18-9-of-the-web-has-over-46m-downloads-according-to-founder-matt-mullenweg/
[11]: http://tom.preston-werner.com/2008/11/17/blogging-like-a-hacker.html
[12]: http://middlemanapp.com/
[13]: http://prose.io/
[14]: https://github.com/rtomayko/tilt
[15]: http://forum.middlemanapp.com/
[16]: http://directory.middlemanapp.com/#/extensions/all
[17]: http://daringfireball.net/projects/markdown/syntax#philosophy
[18]: http://nanoc.ws/about/#similar-projects
[19]: https://github.com/plasticine/middleman-imageoptim
[20]: http://zurb.com/playground/foundation-icons
[21]: https://github.com/fredjean/middleman-s3_sync
[22]: https://github.com/dconjar/dconjar