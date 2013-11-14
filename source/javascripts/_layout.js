// To ensure that the sidebar border stretches
// to the bottom of the page, set the min-height
// of the sidebar to the height of the window

if ($(window).height() > $('.col-content').height()) {
    $('.col-content').height($(window).height())
}