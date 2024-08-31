@extends('layouts.app_home')

@section('title')
Customers
@endsection
@section('css')
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.dataTables.css"/>

@endsection
@section('content')
<div class="container-fluid mt--8">

    <div class="row">
        <div class="col-lg-12 col-md-12">

                <div class="card" style="width: 100%">

                    <div class="card-header">
                     Customers
                    </div>

                    <div class="card-body">




                <div class="row">

                    <div class="col-lg-4 col-md-4">

                        <form action="" method="post">

                            @csrf
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">put the DNI</label>
                                <input type="text" class="form-control" placeholder="DNI" name="dni"  required>
                              </div>

                              <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Select a region</label>
                                <select class="form-select" aria-label="Default select example" name="select_regions"  required>
                                    <option value="">Select a region</option>

                                  </select>
                              </div>

                              <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Select a commune</label>
                                <select class="form-select" aria-label="Default select example" name="select_communes" required>
                                    <option value="">Select a commune</option>

                                  </select>
                              </div>



                              <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Put the email</label>
                                <input type="email" class="form-control" placeholder="email" name="email" required>
                              </div>

                              <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Put the name</label>
                                <input type="text" class="form-control" placeholder="name" name="name" required>
                              </div>

                              <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Put the lastname</label>
                                <input type="text" class="form-control" placeholder="lastname" name="lastname" required>
                              </div>

                              <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Put the address</label>
                                <input type="text" class="form-control" placeholder="address" name="address">
                              </div>

                              <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Put the data reg</label>
                                <input type="date" class="form-control" placeholder="date_reg" name="date_reg" required>
                              </div>

                              <p class="alert alert-danger" role="alert" hidden id="alert_error"></p>



                              <div class="mb-3">
                             <button class="btn btn-success" id="btn_save">Save</button>
                              </div>
                        </form>
                    </div>

                    <div class="col-lg-8 col-md-8">

                        <b>Customer consults</b>
                        <hr>
                        <div class="row">
                            <div class="col-lg-5 col-md-5">
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Put a email</label>
                                <input type="text" class="form-control" placeholder="email" id="email_search">
                            </div>
                            </div>
                            <div class="col-lg-5 col-md-5">
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Put a dni</label>
                                <input type="text" class="form-control" placeholder="dni" id="dni_search">
                            </div>
                            </div>
                            <div class="col-lg-2 col-md-2">
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Push for find</label>
                                <button style="width: 100%;" id="btn_search" class="btn btn-info sm"><i class="bi bi-search"></i></button>
                            </div>
                            </div>

                        </div>

                        <div id="content_table"></div>
                </div>
            </div>

                    </div>
                </div>
            </div>
        </div>

        @include('layouts.footers.auth')
    </div>
@endsection

@push('js')

<script src="{{ asset('js') }}//customers.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.dataTables.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>


<script>

    function activate_table_customers() {
        var table = $('#table_customers').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": true,
            "responsive": false,

			layout: {
				topStart: {
					buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
				}
			}
		 });

		 //Creamos una fila en el head de la tabla y lo clonamos para cada columna
		 $('#table_customers thead tr').clone(true).appendTo( '#table_customers thead' );

		 $('#table_customers thead tr:eq(1) th').each( function (i) {
			 var title = $(this).text(); //es el nombre de la columna
			 $(this).html( '<input type="text" placeholder="Filtrar" />' );

			 $( 'input', this ).on( 'keyup change', function () {
				 if ( table.column(i).search() !== this.value ) {
					 table
						 .column(i)
						 .search( this.value )
						 .draw();
				 }
			 } );
		 } );


    }
</script>
    <script src="{{ asset('argon') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('argon') }}/vendor/chart.js/dist/Chart.extension.js"></script>
@endpush
