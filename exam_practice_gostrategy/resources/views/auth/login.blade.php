@extends('layouts.app', ['class' => 'bg-default'])

@section('title')
Inicio de sesión
@endsection


@section('content')
    @include('layouts.headers.guest')

    <div class="container mt--8 pb-5">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-7">
                <div class="card bg-secondary shadow border-0">
                    <div class="card-header bg-transparent pb-2">
                        <div class="text-muted text-center mt-2 mb-3"><b>{{ __('Log In') }}</b></div>

                    </div>
                    <div class="card-body px-lg-5">
                        <div class="text-center text-muted mb-4">
                            <small>
                                Enter your email and password to log in

                            </small>
                        </div>
                        <form role="form" method="POST" action="{{ route('logueo') }}">
                            @csrf

                            <div class="form-group mb-3">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                    </div>
                                    <input class="form-control" placeholder="email" type="email" name="email"  required autofocus>
                                </div>



                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                    </div>
                                    <input class="form-control" name="password" placeholder="password" type="password" value="" required>
                                </div>
                            </div>


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


                            <div class="text-center">
                                <button type="submit" class="btn btn-primary my-4">Enter</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row mt-3">

                    <div class="col-12 text-right">
                        <a href="{{route('register')}}" class="text-light">
                            <small>{{ __('Create new account') }}</small>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
