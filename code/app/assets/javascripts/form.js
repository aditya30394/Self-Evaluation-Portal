/*$(function(){
    
    $('#addNewOption').click(function (event) {
      addNewOption();
      event.preventDefault(); // Prevent link from following its href
    });*/
    
    function removeOption(data){
      $(data).parent().remove();
      event.preventDefault(); // Prevent link from following its href
    }

    function addNewOption(){
        
        var newCol = $($('.col-md-12')[0]).clone();
        
        newCol.find('input').each(function() {
          if($(this).attr('type') == "text"){
            $(this).attr('name',"problem[options[option" + $('.col-md-12').size() + "]]");
            $(this).attr('placeholder', "Option " + ($('.col-md-12').size()));
            $(this).attr('value',"");
          } else {
            $(this).attr('name',"problem[correct[option" + $('.col-md-12').size() + "]]");
            $(this).attr('checked', false); 
          }
        });
        
        $('#options').append($(newCol))   
    }
/*})*/