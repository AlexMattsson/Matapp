@extends('layout.base')
@section('title', 'Home')
@section('content')
    <div class="col-md-12" id="app">
        <div class="row">
            <div class="col-md-6">
                <p class="text-center" id="olearys">Olearys</p>
                <chart :data='@json($data)' :resturant="'Olearys'" ></chart>
            </div>
            <div class="col-md-6">
                <p class="text-center" id="greek">Greek grill</p>
                <chart :data='@json($data)' :resturant='"Greek Grill"'></chart>
            </div>
        </div>
    </div>
    
@endsection
@section('scripts')
    <script>
        window.data = JSON.parse(`{!! $data ?? ''!!}`);
    </script>
    <script src="/js/index.js"></script>
@endsection