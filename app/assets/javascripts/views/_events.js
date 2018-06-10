$('document').ready(function () {
    function toogleFields() {
        var status = document.getElementById("event_all_day").checked;

        $('#event_starts_at_4i').toggle(!status);
        $('#event_starts_at_5i').toggle(!status);
        $('#event_ends_at_4i').toggle(!status);
        $('#event_ends_at_5i').toggle(!status);
    }

    $('#event_all_day').change(function () {
        toogleFields();
    })
})
