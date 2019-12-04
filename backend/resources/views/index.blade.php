@extends('layout.base')
@section('title', 'Home')
@section('content')
<div class="col-md-12" id="app">
    <div class="row">
        <div class="col-md-6">
            <p class="text-center" id="olearys">Olearys</p>
            <chart :data='@json($data)' :resturant="'Olearys'"></chart>
            <cause :data='@json($data)' :resturant="'Olearys'"></cause>
        </div>
        <div class="col-md-6">
            <p class="text-center" id="greek">Greek grill</p>
            <chart :data='@json($data)' :resturant='"Greek grill"'></chart>
            <cause :data='@json($data)' :resturant='"Greek grill"'></cause>
        </div>
    </div>
</div>

@endsection