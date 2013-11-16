// Remove sidebar panels that extend below the content

var fixSidebarHeight = function () {

    var sidebar = '.col-sidebar'
      , content = '.col-content'
      , panels  = sidebar + ' .panel'
      , sidebarLongerThanContent = ($(sidebar).height() > $(content).height())

    if (sidebarLongerThanContent){
        while (sidebarLongerThanContent){
            if ($(window).height() > $(sidebar).height()) {
                return;
            }

            var i = $(panels).length - 1
            $($(panels)[i]).remove()

            sidebarLongerThanContent = ($(sidebar).height() > $(content).height())
        }
    }

}

// Make sure content column fills window height

var fillWindowHeight = function () {

    if ($(window).height() > $('.col-content').height()) {
        $('.col-content').height($(window).height())
    }

}