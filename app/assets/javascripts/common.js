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