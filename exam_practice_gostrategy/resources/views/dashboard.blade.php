@extends('layouts.app_home')

@section('title')
Home
@endsection

@section('content')
<div class="container-fluid mt--8">

    <div class="row">
        <div class="col-lg-12 col-md-12">

                <div class="card" style="width: 100%">

                    <div class="card-header">
                        Welcome to my FullStack PHP test

                    </div>

                    <div class="card-body">


                        @if (session('message'))
                        <div class="form-group">

                        <p class="alert alert-success" role="alert"> {{ session('message') }}</p>

                    </div>
                    @endif


                    @if (session('message_error'))
                    <div class="form-group">

                    <p class="alert alert-danger" role="alert"> {{ session('message_error') }}</p>

                </div>
                @endif

                    </div>
                </div>
            </div>
        </div>

        @include('layouts.footers.auth')
    </div>
@endsection

@push('js')
    <script src="{{ asset('argon') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('argon') }}/vendor/chart.js/dist/Chart.extension.js"></script>
@endpush
