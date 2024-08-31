@extends('layouts.app', ['class' => 'bg-default'])


@section('title')
Creación de sesión
@endsection

@section('content')
    @include('layouts.headers.guest')

    <div class="container mt--8 pb-5">
        <!-- Table -->
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="card bg-secondary shadow border-0">
                    <div class="card-header bg-transparent pb-1">
                        <div class="text-muted text-center mt-2 mb-4"><b>{{ __('Create new account') }}</b></div>

                    </div>
                    <div class="card-body  px-lg-5">
                        <div class="text-center text-muted mb-4">
                            <small>
                                Enter your data to create your new user:
                            </small>
                        </div>
                        <form role="form" method="POST" action="{{ route('register.save') }}">
                            @csrf

                            <div class="form-group">
                                <div class="input-group input-group-alternative mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                                    </div>
                                    <input class="form-control" placeholder="full name" type="text" name="name" value="" required autofocus>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-alternative mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                    </div>
                                    <input class="form-control" placeholder="email" type="email" name="email" value="" required>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                    </div>
                                    <input class="form-control" placeholder="password" type="password" name="password" required>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                    </div>
                                    <input class="form-control" placeholder="confirmation password" type="password" name="password_confirmation" required>
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
                                <button type="submit" class="btn btn-primary mt-4">{{ __('Created account') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
                 <div class="row mt-3">

                    <div class="col-12 text-right">
                        <a href="{{route('login')}}" class="text-light">
                            <small>{{ __('I have accound!') }}</small>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
