<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <script src="chart.js"></script>
    <title>admin</title>
</head>

<body>
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

    <a class="btn btn-primary" href="/options.blade.php" role="button">
        options
    </a>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script type="text/javascript">
        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'doughnut',
            // The data for our dataset
            data: {
                labels: ['Bra', 'Ok', 'Sådär', 'Dåligt'],
                datasets: [{
                    label: 'rating',
                    backgroundColor: ["#388E3C", "#AFB42B", "#FF7043", "#C62828"],
                    borderColor: ["#388E3C", "#AFB42B", "#FF7043", "#C62828"],
                    data: [1, 1, 1, 1],
                }]
            },

            // Configuration options go here
            options: {}
        });

        var ctx = document.getElementById('myChart2').getContext('2d');
        var chart2 = new Chart(ctx, {
            // The type of chart we want to create
            type: 'doughnut',
            // The data for our dataset
            data: {
                labels: ['Bra', 'Ok', 'Sådär', 'Dåligt'],
                datasets: [{
                    label: 'rating',
                    backgroundColor: ["#388E3C", "#AFB42B", "#FF7043", "#C62828"],
                    borderColor: ["#388E3C", "#AFB42B", "#FF7043", "#C62828"],
                    data: [4, 2, 2, 4],
                }]
            },

            // Configuration options go here
            options: {}
        });
    </script>
    </canvas>
    </script>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
</body>

</html>