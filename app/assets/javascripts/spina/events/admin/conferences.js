$(document).on('turbolinks:load', function() {
  $('select.select2').select2();
});

$(document).on('turbolinks:before-cache', function() {
  $('select.select2').select2('destroy');
});

// Dynamically sponsor_fields as a nested form
$(document).on('click', 'form .add_sponsor_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  $(this).closest('form').trigger('spina:sponsor_fields_added');
  $('.no-sponsors').slideUp();
  event.preventDefault();
});

$(document).on('spina:sponsor_fields_added', 'form', function(e) {
  $('select.select2').select2();
  $('input[data-switch]').spinaSwitch();
});

// Dynamically question_fields as a nested form
$(document).on('click', 'form .add_question_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  $(this).closest('form').trigger('spina:question_fields_added');
  $('.no-questions').slideUp();
  event.preventDefault();
});

$(document).on('spina:question_fields_added', 'form', function(e) {
  $('input[data-switch]').spinaSwitch();
});

// Dynamically ticket_fields as a nested form
$(document).on('click', 'form .add_ticket_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  $(this).closest('form').trigger('spina:ticket_fields_added');
  $('.no-tickets').slideUp();
  event.preventDefault();
});

$(document).on('spina:ticket_fields_added', 'form', function(e) {
  $('input[data-switch]').spinaSwitch();
});

// Dynamically session_fields as a nested form
$(document).on('click', 'form .add_session_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  $(this).closest('form').trigger('spina:session_fields_added');
  $('.no-sessions').slideUp();
  event.preventDefault();
});

$(document).on('spina:session_fields_added', 'form', function(e) {
  $('input[data-switch]').spinaSwitch();
});