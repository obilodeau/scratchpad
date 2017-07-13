// if you have jquery in your namespace and want to extract content you can use
// its CSS selector syntax

// this will return all strong tags below anything with a
// session-periode-description class
$(".session-periode-description>strong");

// print and/or apply operation to each match:
$(".session-periode-description>strong").each(function(idx) {
    console.log($(this).text());
    // attribute extraction: $(this).attr('href');
});
