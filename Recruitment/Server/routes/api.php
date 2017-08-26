<?php


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
$api = app('Dingo\Api\Routing\Router');
$api->version('v1', function ($api) {

    $api->group(['middleware' => ['bindings']], function ($api) {
        $api->post('users','App\Http\Controllers\Api\UserController@store');
        $api->get('offers', 'App\Http\Controllers\Api\OfferController@index');
        $api->get('offers/{offer}/comments', 'App\Http\Controllers\Api\CommentController@index');
        $api->get('users/{user}/news', 'App\Http\Controllers\Api\NewsController@index');
    });



    $api->group(['middleware' => ['auth:api','bindings']], function ($api) {
        $api->post('offers/{offer}/comments', 'App\Http\Controllers\Api\CommentController@store');
        $api->get('offers/{offer}/favour', 'App\Http\Controllers\Api\UserFavourOfferController@toggle');
        $api->post('offers/{offer}/resumes/{resume}', 'App\Http\Controllers\Api\ResumeController@send');


        $api->get('offers/favours','App\Http\Controllers\Api\UserFavourOfferController@index');

        $api->get('resumes', 'App\Http\Controllers\Api\ResumeController@index');
        $api->delete('resumes/{resume}', 'App\Http\Controllers\Api\ResumeController@destroy');
        $api->put('resumes/{resume}', 'App\Http\Controllers\Api\ResumeController@update');
        $api->post('resumes', 'App\Http\Controllers\Api\ResumeController@store');


    });
});


