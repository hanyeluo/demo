<?php

Route::get('login',function () {
    return view('user.login');
});

Route::post('login','UserController@login');

Route::get('regist',function () {
    return view('user.regist');
});

Route::post('regist','UserController@regist');
Route::get('logout', 'UserController@logout');

Route::group(['middleware' => 'auth'], function () {
    Route::get('/', 'UserController@index');
    Route::get('users', 'UserController@index');
    Route::get('users/{user}/enable', 'UserController@enable');
    Route::get('users/{user}/disable', 'UserController@disable');

    Route::get('/offers', 'OfferController@index');
    Route::get('/offers/{offer}/enable', 'OfferController@enable');
    Route::get('/offers/{offer}/disable', 'OfferController@disable');
    Route::get('/offers/{offer}/edit', 'OfferController@edit');
    Route::get('/offers/{offer}/top', 'OfferController@top');
    Route::post('/offers/{offer}/update', 'OfferController@update');


});



Route::group(['domain' => env('SUPPORT_DOMAIN')], function () {
    Route::get('/newses/{news}', 'NewsController@show');
});