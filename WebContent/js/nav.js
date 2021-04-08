
// very simple to use!
$(".nav-link.dropdown-toggle").hover( function () {
    // Open up the dropdown
    $(this).removeAttr('data-toggle'); // remove the data-toggle attribute so we can click and follow link
    $(this).parent().addClass('show'); // add the class show to the li parent
    $(this).next().addClass('show'); // add the class show to the dropdown div sibling
}, function () {
    // on mouseout check to see if hovering over the dropdown or the link still
    var isDropdownHovered = $(this).next().filter(":hover").length; // check the dropdown for hover - returns true of false
    var isThisHovered = $(this).filter(":hover").length;  // check the top level item for hover
    if(isDropdownHovered || isThisHovered) {
        // still hovering over the link or the dropdown
    } else {
        // no longer hovering over either - lets remove the 'show' classes
        $(this).attr('data-toggle', 'dropdown'); // put back the data-toggle attr
        $(this).parent().removeClass('show');
        $(this).next().removeClass('show');
    }
});
// Check the dropdown on hover
$(".dropdown-menu").hover( function () {
}, function() {
    var isDropdownHovered = $(this).prev().filter(":hover").length; // check the dropdown for hover - returns true of false
    var isThisHovered= $(this).filter(":hover").length;  // check the top level item for hover
    if(isDropdownHovered || isThisHovered) {
        // do nothing - hovering over the dropdown of the top level link
    } else {
        // get rid of the classes showing it
        $(this).parent().removeClass('show');
        $(this).removeClass('show');
    }
});