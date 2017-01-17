$(document).on('turbolinks:load', function(){
  $(document).on('click', '#btn-mark', function(e){
    e.preventDefault();
    var url = $(this).prop('href');
    $.ajax({
      url: url,
      type: 'PUT',
      dataType: 'json',
      success: function(data){
        var favorite = "true";
        var link_text = "Favorite";
        if(data.mark.is_favorite) {
          var favorite = "false";
          var link_text = "Unfavorite";
        }
        var html = '<a id="btn-mark" class="btn btn-default"\
            href="/marks/' + data.mark.id + '?favorite=' + favorite + '">' +
            link_text + '</a>';
        $('.mark_btn').html(html);

        var favorite_class = data.mark.is_favorite ? 'favorited' : '';
        $('.mark_label').html('<i class="fa fa-heart fa-3x ' + favorite_class + '"></i>');
      }
    });
  });
});
