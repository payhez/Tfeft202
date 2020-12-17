<html>

 <head>
	<title>Tfeft202</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
	
	<link rel="stylesheet" href="global/css/bootstrap.min.css">
	<link rel="stylesheet" href="global/css/jquery.dataTables.min.css" />
	
	<style type="text/css">
	 	td.details-control {
	    background: url('global/img/details_open.png') no-repeat center center;
	    cursor: pointer;
	}
	tr.details td.details-control {
	    background: url('global/img/details_close.png') no-repeat center center;
	}
	 </style>
	<script src="global/js/jquery-3.5.1.js"></script>
	<script src="global/js/jquery.dataTables.min.js"></script>
	<script src="global/js/popper.min.js"></script>
	<script src="global/js/bootstrap.min.js"></script>
   
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
 </body>
</html>
<script type="text/javascript">

var dt = null; // datatable

$(document).ready(function() {
	
	load_table();
	
	function load_table(){
		var jsonreq = new Object();
        jsonreq.action="fetch";
		sendAjax(jsonreq);
	}
	
	$("#updateItem").click(function (){
		var jsonreq = new Object();
		jsonreq.action= "update";
		jsonreq.id = $("#u_id").val();
		jsonreq.gtibCode =  $("#u_gtib").val();
		jsonreq.comp =  $("#u_comp").val();
		jsonreq.itemCode =  $("#u_item").val();
		sendAjax(jsonreq);
		$("#updateModal").modal('hide');
		load_table();
	});
	
	$("#save").click(function (){
		var jsonreq = new Object();
		jsonreq.action="insert";
		jsonreq.gtibCode =  $("#gtib").val();
		jsonreq.comp =  $("#comp").val();
		jsonreq.itemCode =  $("#item").val();
		sendAjax(jsonreq);
		$("#insertModal").modal('hide');
		console.log(jsonreq);
		load_table();
	});
	
	$("#addNew").click(function (){
		$("#gtib").val("");
		$("#comp").val("");
		$("#item").val("");
	});
	
    function sendAjax(jsonreq){
		$.ajax({
		    url: "${pageContext.request.contextPath}/TrialServlet",
		    type: "POST",
		    dataType: "json",
		    data: JSON.stringify(jsonreq),
		    contentType: "application/json",
		    mimeType: 'application/json',
		    async: true,
		    success: function(data) {
		    	
		    	if(jsonreq.action == "fetch"){
		    		
		    		if(dt==null){
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
		    		}else{
		    			/*dt.clear().draw();
		    			dt.rows.add(data); // Add new data
		    			dt.columns.adjust().draw(); // Redraw the DataTable*/
		    			location.reload();
		    			//return false;
		    			
		    		}
		    	}
		    	
	        	var clickedRow = null;
	        	var previousRow= null;
	        	var clickedTr = null;
	        	var previousTr= null;
	        	 
	        	 
	       	    $('#example tbody').on( 'click', 'tr td.details-control', function () {
	       	    	
	       	        clickedTr = $(this).closest('tr');
	       	        clickedRow = dt.row( clickedTr );
	       	        
	       	        if(previousRow == null){
	       	        	previousRow=clickedRow;
	       	        	previousTr=clickedTr;
	       	        	clickedRow.child( format( clickedRow.data() ) ).show();
	       	        	clickedTr.addClass( 'details' );
	       	        }else if(clickedRow.child.isShown()){
	       	        	clickedRow.child.hide();
	       	        	previousTr.removeClass( 'details' );
	       	        }else{
	       	        	previousRow.child.hide();
	       	        	previousRow= null;
	       	        	previousTr.removeClass( 'details' );
	       	        	previousTr = null;
	       	        	previousRow=clickedRow;
	       	        	previousTr=clickedTr;
	       	        	clickedRow.child( format( clickedRow.data() ) ).show();
	       	        	clickedTr.addClass('details');
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
          	        		jsonreq.action="delete";
          	        		jsonreq.id=clickedRow.data().id;
          	        		sendAjax(jsonreq);
          	        		load_table();
     	            	}
      	        	});
	       	    } );
		    }/*,
		    error: function(error){
		    	alert(error.responseText);
		    }*/
		});
	}
} );

function format ( d ) {
	
	/*'<b>Code List Name:</b> '+d.codeListName+'<br>'+
    '<b>Object Name:</b> '+d.objectName+'<br>'+*/
    
    var isActive;
    var updateDate;
    var updatePerson;
    
    if(d.upd_tst==null){
    	updateDate = "Henuz guncellenmedi";
    	updatePerson="Henuz guncellenmedi";
    }else{
    	updateDate = d.upd_tst;
    	updatePerson=d.upd_usr;
    }
    
    if(d.isActive){
    	isActive = "Aktif";
    }else{
    	isActive = "Aktif Değil";
    }
    
    return '<b>Guncelleyen:</b> '+updatePerson+'<br>'+
    '<b>Guncelleme Tarihi:</b> '+updateDate+'<br>'+
    '<b>Aktiflik Durumu:</b> '+isActive+'<br><br>'+
        '<button id= "update" type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal">Update</button>'+
        '   '+
        '<button id="delete" type="button" class="btn btn-danger">Delete</button>';
}

</script>