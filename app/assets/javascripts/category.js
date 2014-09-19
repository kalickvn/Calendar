var g_category_path = "/categories/";
var g_displayLength = 10;
var Category = {
  getdata: function(){
    var table = $("#categories_list").dataTable({
      sDom: '<"#tbhead"<"row"<"col col-lg-6 col-offset-6"f>>>rt<"#tbfoot"<"row"<"col col-lg-6"l><"col col-lg-6"p>>>',
        "bFilter": false,
        "bLengthChange": true,
        "bInfo": false,
        "bProcessing": true,
        "bServerSide": true,
        "sPaginationType": "full_numbers",
        "bJQueryUI": false,
        "bPaginate": true,
        "oLanguage": {
          "sEmptyTable": I18n.t('datatable.no_record'),
          "sZeroRecords": I18n.t('datatable.no_record'),
          "sSearch": I18n.t('datatable.search'),
        },
        "iDisplayLength": 5,
        "aaSorting": [[ 0, "asc" ]],
        "aoColumns": [
          { "sTitle": "Loaị lịch",
            "sClass": "left",
            'bSortable': true,
            "sWidth": "20%",
            "mData": "name",
            "sClass": "left-round"
          },
          { "sTitle": "Mô tả",
            "sClass": "left",
            'bSortable': true,
            "sWidth": "30%",
            "mData": "description"
            
          },
          { "sTitle": "Hiển thị menu",
            "sClass": "left",
            'bSortable': true,
            "sWidth": "20%",
            "mData": "is_show_menu",
            "mRender": Common.render_yes_no
          },
          { "sTitle": "Thứ tự",
            "sClass": "right",
            'bSortable': true,
            "sWidth": "20%",
            "mData": "order_no",
            "mRender": Common.render_number,
            "sClass": "right-round last-column"
          }
          ],
          "sAjaxSource": g_category_path
          // "fnServerParams": function ( aoData ) {
          //   aoData.push( { "name": "category_id", "value": $(this).attr('id').split("_")[1]});
          // },
          // "fnDrawCallback": function(oSettings) {
          //   $('tbody tr').addClass("mb-table-row")
          // },
          // "fnInitComplete": function () {
          //   $("#" + $(this)[0].getAttribute("id") + " tbody tr").addClass("mb-table-row")
            
          // },
      });
  }

}
$(document).ready(function(){
  Category.getdata();
});