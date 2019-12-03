@extends('layout.base')
@section('title', 'Classes')
@section('content')
    <div class="container row" id="app">
        <div class="col-md-6">
            <class-page :data='@json($data)'></class-page>
        </div>
    </div>
            
@endsection
@section('scripts')
    
@endsection