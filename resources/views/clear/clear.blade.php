<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>Clear</title>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm-12">
                <div class="jumbotron">
                    <p class="lead">
                        <strong>Status : </strong>
                        @if(session()->has('clearMsg'))
                            {{ session('clearMsg') }}
                        @endif
                    </p>
                    <hr class="my-4">
                    <a href="{{ url('/all-clear') }}" class="btn btn-danger">All Clear</a>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <a href="{{ url('/clear-view') }}" class="btn btn-secondary">View Clear</a>
                        <a href="{{ url('/clear-cache') }}" class="btn btn-dark">Cache Clear</a>
                        <a href="{{ url('/clear-route') }}" class="btn btn-secondary">Route Clear</a>
                        <a href="{{ url('/clear-config') }}" class="btn btn-dark">Config Clear</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>