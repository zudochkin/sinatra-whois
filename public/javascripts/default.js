$(function() {
  $('form').submit(function() {
    $.post('/ajax.json', $(this).serialize(), function(data) {
      if (!data) {
	alert('Что-то пошло не так (');
	return;
      }

      $.each(data.info, function(field, value) {
	$('ul#info').append('<li><strong>' + field + '</strong> ' + value + '</li>')
      });
      console.log(data);
    }, 'json');
    return false;
  });
});
