// also known as associative arrays

for (key in dict) {
    var value = dict[key];
}

// jquery-way
$.each(data, function(key, value) {
    alert( "The key is '" + key + "' and the value is '" + value + "'" );
});
