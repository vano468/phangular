<!DOCTYPE html>
<html ng-app='Application'>
<head>
    <title>
        Phangular
    </title>
    {{ stylesheet_link("vendor/stylesheets/bootstrap.min.css") }}
    {{ stylesheet_link("vendor/stylesheets/font-awesome.min.css") }}
    {{ stylesheet_link("app/build/app.min.css") }}
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            {{ link_to('', 'Phangular', 'class': 'navbar-brand') }}
        </div>
    </div>
</nav>

<div class="container">
    <div ui-view></div>
</div>

{{ javascriptInclude("vendor/scripts/jquery.min.js") }}
{{ javascriptInclude("vendor/scripts/bootstrap.min.js") }}
{{ javascriptInclude("vendor/scripts/angular.min.js") }}
{{ javascriptInclude("vendor/scripts/angular-sanitize.min.js") }}
{{ javascriptInclude("vendor/scripts/angular-ui-router.min.js") }}
{{ javascriptInclude("app/build/app.min.js") }}
</body>
</html>