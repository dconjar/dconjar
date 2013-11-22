// When people click the search button, load the Google search box

var loadSearchBox = function () {
    $('.search-button').click(function () {
        $('.masthead-search').toggle(1000)
        $('.search-box input[type=text').focus()
    })
}