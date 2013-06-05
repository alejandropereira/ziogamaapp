# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Override Rails handling of confirmation
jQuery ->
  Morris.Line
    element: 'graph'
    data: $('#graph').data('orders')
    xkey: 'created_at'
    ykeys: ['countdate']
    labels: ['Prospectos']
    xLabelFormat: (date) ->
      return date.getDate()+'/'+(date.getMonth()+1)+'/'+date.getFullYear()
    xLabels:'day'
    dateFormat: (date) ->
      d = new Date(date) 
      d.getDate()+'/'+(d.getMonth()+1)+'/'+d.getFullYear(); 

$.rails.allowAction = (element) ->
  # The message is something like "Are you sure?"
  message = element.data('confirm')
  # If there's no message, there's no data-confirm attribute, 
  # which means there's nothing to confirm
  return true unless message
  # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
  $link = element.clone()
    # We don't necessarily want the same styling as the original link/button.
    .removeAttr('class')
    # We don't want to pop up another confirmation (recursion)
    .removeAttr('data-confirm')
    # We want a button
    .addClass('btn').addClass('btn-danger')
    # We want it to sound confirmy
    .html("Si, deseo eliminar")

  # Create the modal box with the message
  modal_html = """
               <div class="modal" id="myModal">
                 <div class="modal-header">
                   <a class="close" data-dismiss="modal">×</a>
                   <h3>#{message}</h3>
                 </div>
                 <div class="modal-body">
                   <p>Se eliminara completamente de la base de datos.</p>
                 </div>
                 <div class="modal-footer">
                   <a data-dismiss="modal" class="btn">Cancelar</a>
                 </div>
               </div>
               """
  $modal_html = $(modal_html)
  # Add the new button to the modal box
  $modal_html.find('.modal-footer').append($link)
  # Pop it up
  $modal_html.modal()
  # Prevent the original link from working
  return false