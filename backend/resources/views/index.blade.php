@extends('layout.base')
@section('title', 'Home')
@section('content')
    <div class="col-md-12" id="app">
        <div class="row">
            <div class="col-md-6">
                <info-tree :data='@json($data)' :resturant='"Greek grill"'></info-tree>
            </div>
            <div class="col-md-6">
                <info-tree :data='@json($data)' :resturant='"Olearys"'></info-tree>
            </div>
        </div>
    </div>
    
@endsection