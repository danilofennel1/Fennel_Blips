$(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;

        if (data.open === true) {
            $('body').show();
        } else if (data.open === false) {
            $('body').hide();
        }
    })

    $('#conferma').click(function() {
        var id = $('.idinp').val();
        var color = $('.coinp').val();
        var name = $('.nameinp').val();
        var scale = $('.ginp').val();
        $('body').hide();
        $.post('https://Fennel_Blips/action', JSON.stringify({
            azione: 'setta',
            id: id,
            color: color,
            name: name,
            grandezza: scale
        }))
    })

    $('#delete').click(function() {
        $('body').hide();
        $.post('https://Fennel_Blips/action', JSON.stringify({
            azione: 'close',
        }))
    })
})