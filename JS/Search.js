function SearchGrid(txtSearch, grd) {
    if ($("[id *=" + txtSearch + " ]").val() != "") {
        $("[id *=" + grd + " ]").children
        ('tbody').children('tr').each(function () {
            $(this).show();
        });
        $("[id *=" + grd + " ]").children
        ('tbody').children('tr').each(function () {
            var match = false;
            $(this).children('td').each(function () {
                if ($(this).text().toUpperCase().indexOf($("[id *=" +
            txtSearch + " ]").val().toUpperCase()) > -1) {
                    match = true;
                    return false;
                }
            });
            if (match) {
                $(this).show();
            }
            else {
                $(this).hide();
            }
        });


        $("[id *=" + grd + " ]").children('tbody').
                children('tr').each(function (index) {
                    if (index == 0)
                        $(this).show();
                });
    }
    else {
        $("[id *=" + grd + " ]").children('tbody').
                children('tr').each(function () {
                    $(this).show();
                });
    }
}