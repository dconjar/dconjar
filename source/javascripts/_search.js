// When people click the search button, load the Google search box

var loadSearchBox = function () {
    $('.search-button').click(function () {
        var cx = '012678659512652096230:rptlv7dhesq';
        var gcse = document.createElement('script');
        gcse.type = 'text/javascript';
        gcse.async = true;
        gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
          '//www.google.com/cse/cse.js?cx=' + cx;
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(gcse, s);
        
        $('.search-box').toggle(1000)
        $('.search-box input[type=text').focus()
    })
}