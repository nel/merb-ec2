// Common JavaScript code across your application goes here.

jQuery(document).ready(function() {

    jQuery(".delete").click(function(e) {
        if (confirm("Are you sure?")) {
            var href = $(this).attr('href');
    
            form = $("<form action='" + href + "' method='POST'>"
              + "<input type='hidden' name='_method' value='DELETE'/>"
              + "</form>"
              ).appendTo("body");

            form.submit();
        }
        return false;
    });

});
