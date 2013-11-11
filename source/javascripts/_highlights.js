function addScrollingCodeBlocks() {

    var container   = '.highlight'
      , highlights  = $(container)

    if (highlights.length === 0) {
        return;
    }

    for (var i = 0; i < highlights.length; i++) {

        var htmls = $(highlights[i]).html()
          , lines = htmls.match(/^(\s*?<span[^\n]*)$/mg)
          , longestLine = 0

        for (var j = 0; j < lines.length; j++) {

            var spans = $(lines[j])
              , whitespace = lines[j].match(/^(\s*)/g)
              , contents = '' + whitespace

            for (var k = 0; k < spans.length; k++) {
                var content = $(spans[k]).text()
                contents += content
            }

            if (contents.length > longestLine) {
                longestLine = contents.length
                thing = contents
            }

        }

        var idealWidth = longestLine * 8

        if ($(highlights[i]).width() < idealWidth) {
            $(highlights[i]).width(idealWidth)
        }

        if ($('.highlight-container').length < highlights.length) {

            // Add a <figure> around the code block
            // to control the overflow-x

            var figure = "<figure class='highlight-container'></figure>"
            $(highlights[i]).wrap(figure)

            // And add a "figcaption" of the language

            var language = $(highlights[i]).attr('class').split(' ')[1]
            var figcaption = "<figcaption class='highlight-language'>"+language+"</figcaption>"
            $($(highlights[i]).parent()).prepend(figcaption)

        }
    }
}