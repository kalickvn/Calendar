var Common = {
  render_yes_no: function(obj){
    if(obj ==true){
      return "Yes";
    }else{
      return "No";
    }
  },
  // 
  render_number: function(obj){
    return accounting.formatNumber(obj);
  }

}

function sendFile(file, editor, welEditable){
  data = new FormData();
  data.append("file", file);
  $.ajax({
      data: data,
      type: "POST",
      url: "/settings/normal_upload",
      cache: false,
      contentType: false,
      processData: false,
      success: function(url) {
        console.log("success");
        console.log(url);
        console.log(welEditable);
        editor.insertImage(welEditable, url);
      },
      error: function(msg){
        console.log(msg);

      }
  });
}

function progressHandlingFunction(e){
    if(e.lengthComputable){
        $('progress').attr({value:e.loaded, max:e.total});
        // reset progress on complete
        if (e.loaded == e.total) {
            $('progress').attr('value','0.0');
        }
    }
}