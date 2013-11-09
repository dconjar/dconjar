// Remove sidebar panels that extend below the content

var fixSidebarHeight = function(){

    var sidebar = '.col-sidebar'
      , content = '.col-content'
      , panels  = sidebar+' .panel'
      , sidebarLongerThanContent = ($(sidebar).height() > $(content).height())

    if (sidebarLongerThanContent){
        while (sidebarLongerThanContent){
            var i = $(panels).length - 1
            $(panels)[i].remove()

            sidebarLongerThanContent = ($(sidebar).height() > $(content).height())
        }
    }

}