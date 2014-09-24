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
        console.log(url);
        editor.insertImage(welEditable, url);
      },
      error: function(msg){
        console.log(msg);

      }
  });
}