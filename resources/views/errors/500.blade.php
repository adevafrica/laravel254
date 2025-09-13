<!DOCTYPE html>
<html dir="ltr" lang="en-US">

<head>
    <!-- Metas -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Document Title -->
    <title>500 | Server Error</title>

    <!-- Links -->
    <link rel="icon" type="image/ico" href="{{ asset('frontend/images') }}/{{$ecommerce_setting->favicon ?? ''}}" />
    <!-- Plugins CSS -->
    <link href="{{ asset('frontend/css/plugins.css') }}" rel="stylesheet" />

    <!-- style CSS -->
    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('frontend/css/style.css') }}">
    <noscript>
        <link rel="stylesheet" href="{{ asset('frontend/css/style.css') }}">
    </noscript>
    <!-- google fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" rel="stylesheet" />
</head>

<body>
    <section class="error-section mt-5 mb-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="error-icon">

                    </div>
                </div>
                <div class="col-md-6 offset-md-3 error-text text-center">
                    <i class="las la-exclamation-triangle" style="color:var(--theme-color);font-size: 90px;margin-bottom:30px"></i>
                    <h2 class="h1">Internal Server Error</h2>
                    <p class="lead">Oops! Something went wrong on our server.</p>
                </div>
            </div>
        </div>
    </section>
</body>

</html>
