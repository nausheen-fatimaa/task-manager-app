document.addEventListener("DOMContentLoaded", function () {


const deleteForms =
    document.querySelectorAll(
        'form input[value="delete"]'
    );

deleteForms.forEach(function (input) {

    const form = input.closest("form");

    form.addEventListener(
        "submit",
        function (event) {

            const confirmed =
                confirm(
                    "Are you sure you want to delete this task?"
                );

            if (!confirmed) {
                event.preventDefault();
            }

        }
    );

});


});
