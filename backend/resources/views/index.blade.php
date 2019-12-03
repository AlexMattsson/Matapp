@extends('layout.base')
@section('title', 'Home')
<body>
    @section('content')
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-6">
                <p class="text-center" id="olearys">Olearys</p>
                <canvas id="myChart" width="20" height="10"></canvas>
            </div>
            <div class="col-md-6">
                <p class="text-center" id="greek">Greek grill</p>
                <canvas id="myChart2" width="20" height="10"></canvas>
            </div>
        </div>
    </div>
      
    @endsection
    @section('scripts')
        @parent
        <script>
            window.data = JSON.parse(`{!! $data ?? ''!!}`);
        </script>
        <script src="/js/index.js"></script>
    @endsection
</body>

</html>