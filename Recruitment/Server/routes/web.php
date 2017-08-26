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
    Route::get('/', 'NewsController@index');
    Route::get('news/create', 'NewsController@create');
    Route::post('news', 'NewsController@store');
    Route::get('news/{news}/delete', 'NewsController@destroy');
    Route::get('news/{news}/edit', 'NewsController@edit');
    Route::post('news/{news}/update', 'NewsController@update');



    Route::get('/offers', 'OfferController@index');
    Route::get('/offers/create', 'OfferController@create');
    Route::post('/offers', 'OfferController@store');
    Route::get('/offers/{offer}/delete', 'OfferController@destroy');
    Route::get('/offers/{offer}/edit', 'OfferController@edit');
    Route::post('/offers/{offer}/update', 'OfferController@update');

    Route::get('/offers/{offer}/comments', 'CommentController@index');
    Route::get('/offers/{offer}/resumes', 'ResumeController@index');

    Route::post('/offers/{offer}/comments', 'CommentController@store');
    Route::get('/comments/{comment}/delete', 'CommentController@delete');

    Route::get('/resumes/{resume}', 'ResumeController@detail');
    Route::get('/resumes/{resume}/favour', 'UserResumeFavourController@toggle');

    Route::get('/favours', 'UserResumeFavourController@index');



});



Route::group(['domain' => env('SUPPORT_DOMAIN')], function () {
    Route::get('/newses/{news}', 'NewsController@show');
});