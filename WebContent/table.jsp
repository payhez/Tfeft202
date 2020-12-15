<html>
 <head>
  <title>Tfeft202</title>
  
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
  
  <style type="text/css">
  	td.details-control {
	    background: url('resources/img/details_open.png') no-repeat center center;
	    cursor: pointer;
	}
	tr.details td.details-control {
	    background: url('/resources/img/details_close.png') no-repeat center center;
	}
  </style>
  
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
 </head>
 
 <body>
 
   <h3 align="center">Trial(Tfeft202)</h3>
   <br />
   
   <button id="addNew" type="button" class="btn btn-success" data-toggle="modal" data-target="#insertModal">Yeni Urun Ekle</button>
        <br/>
        <br/>	
   <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="insertModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="insertModalLabel">Yeni Urun Ekleme</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
			 	<div class="form-group">
			     <label for="email">Gtip Kodu:</label>
			     <input type="text" class="form-control" id="gtib" name="gtib">
			   </div>
			   <div class="form-group">
			     <label for="email">Şirket:</label>
			     <input type="text" class="form-control" id="comp" name="comp">
			   </div>
			   <div class="formı-group">
			     <label for="pwd">Kalem Kodu:</label>
			     <input type="text" class="form-control" id="item" name="item">
			   </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
	        <button id = "save" type="button" class="btn btn-primary">Kaydet</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Urunu Guncelle</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	        <div class="form-group">
			     <input type="text" class="form-control" id="u_id" ReadOnly="true" style="display: none	">
			   </div>
			 	<div class="form-group">
			     <label for="email">Gtip Kodu:</label>
			     <input type="text" class="form-control" id="u_gtib">
			   </div>
			   <div class="form-group">
			     <label for="email">Şirket:</label>
			     <input type="text" class="form-control" id="u_comp" >
			   </div>
			   <div class="formı-group">
			     <label for="pwd">Kalem Kodu:</label>
			     <input type="text" class="form-control" id="u_item">
			   </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
	        <button id = "updateItem" type="button" class="btn btn-primary">Guncelle</button>
	      </div>
	    </div>
	  </div>
	</div>
   <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
            	<th></th>
		        <th>Sirket</th>
		        <th>Kalem kodu</th>
		        <th>Gtip Kodu</th>
		        <th>Olusturan</th>
		        <th>Olusturma Tarihi</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th></th>
		        <th>Sirket</th>
		        <th>Kalem kodu</th>
		        <th>Gtip Kodu</th>
		        <th>Olusturan</th>
		        <th>Olusturma Tarihi</th>
            </tr>
        </tfoot>
    </table>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 </body>
</html>
<script type="text/javascript">

var action = ""; // determines which action is going to be taken
var dt; // datatable

$(document).ready(function() {
	
	load_table();
	
	function load_table(){
		action="fetch";
		var jsonreq = new Object();
        jsonreq.params = new Array();
		sendAjax(jsonreq,action);
	}
	
	$("#updateItem").click(function (){
		action= "update";
		var jsonreq = new Object();
		jsonreq.id = $("#u_id").val();
		jsonreq.gtibCode =  $("#u_gtib").val();
		jsonreq.comp =  $("#u_comp").val();
		jsonreq.itemCode =  $("#u_item").val();
		sendAjax(jsonreq,action);
		$("#updateModal").modal('hide');
		dt.destroy();
		load_table();
	});
	
	$("#save").click(function (){
		var jsonreq = new Object();
		jsonreq.gtibCode =  $("#gtib").val();
		jsonreq.comp =  $("#comp").val();
		jsonreq.itemCode =  $("#item").val();
		sendAjax(jsonreq,action);
		$("#insertModal").modal('hide');
		dt.destroy();
		load_table();
	});
	
	$("#addNew").click(function (){
		action= "insert";
		$("#gtib").val("");
		$("#comp").val("");
		$("#item").val("");
	});
	
    function sendAjax(jsonreq,action){
		$.ajax({
		    url: "${pageContext.request.contextPath}/"+action,
		    type: "POST",
		    dataType: "json",
		    data: JSON.stringify(jsonreq),
		    contentType: "application/json",
		    mimeType: 'application/json',
		    async: true,
		    success: function(data) {
		    	
	        	dt = $('#example').DataTable( {	
	        		data:data,
	        		columns: [
	                    {
	                        class:          "details-control",
	                        orderable:      false,
	                        data:           null,
	                        defaultContent: ""
	                    },
	                    { data: "comp"},
	                    { data: "itemCode"},
	                    { data: "gtibCode"},
	                    { data: "crt_usr"},
	                    { data: "crt_tst"},
	                   ],
	                   order: [[1, 'asc']]
	        	});
	        	
	        	var clickedRow = null;
	        	var previousRow= null;
	        	 
	       	    $('#example tbody').on( 'click', 'tr td.details-control', function () {
	       	    	
	       	        var tr = $(this).closest('tr');
	       	        clickedRow = dt.row( tr );
	       	        
	       	        if(previousRow == null){
	       	        	
	       	        	previousRow=clickedRow;
	       	        	clickedRow.child( format( clickedRow.data() ) ).show();
	       	        }else if(clickedRow.child.isShown()){
	       	        	clickedRow.child.hide();
	       	        }else{
	       	        	previousRow.child.hide();
	       	        	previousRow= null;
	       	        	previousRow=clickedRow;
	       	        	clickedRow.child( format( clickedRow.data() ) ).show();
	       	        }
	       	        $("#update").click(function (){
	       	        	$("#u_id").val(clickedRow.data().id);
	      	        		$("#u_gtib").val(clickedRow.data().gtibCode);
	      	        		$("#u_comp").val(clickedRow.data().comp);
	      	        		$("#u_item").val(clickedRow.data().itemCode);
	      	        	});
	      	            
	      	            $("#delete").click(function (){
	      	            	if (confirm('Do you want to delete the item?')) {
	      	            		action = "delete";
	          	        		var jsonreq = new Object();
	          	        		jsonreq.id=clickedRow.data().id;
	          	        		sendAjax(jsonreq,action);
	          	        		alert("Succesfully deleted!");
	          	        		dt.destroy();
	          	        		load_table();
	     	            	}
	      	        	});
	       	    } );
		    }
		});
	}
} );

function format ( d ) {
    return '<b>Code List Name:</b> '+d.codeListName+'<br>'+
    '<b>Object Name:</b> '+d.objectName+'<br>'+
    '<b>Guncelleyen:</b> '+d.upd_usr+'<br>'+
    '<b>Guncelleme Tarihi:</b> '+d.upd_tst+'<br>'+
    '<b>Active:</b> '+d.isActive+'<br><br>'+
        '<button id= "update" type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal">Update</button>'+
        '   '+
        '<button id="delete" type="button" class="btn btn-danger">Delete</button>';
}

</script>
