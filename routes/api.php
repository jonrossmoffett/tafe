<?php

use App\Http\Controllers\ContactsController;
use GuzzleHttp\Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


*/






Route::middleware('auth:sanctum', 'throttle:60,1')->group(function () {
    //Route::get('/contacts', 'ContactsController@index');
    //Route::get('/contacts/{contact}', 'ContactsController@show');
    //Route::post('/contacts', 'ContactsController@store');
    //Route::patch('/contacts/{contact}', 'ContactsController@update');
    //Route::delete('/contacts/{contact}', 'ContactsController@destroy');

    Route::apiResource('contacts', 'ContactsController');
    Route::apiResource('enquiry', 'EnquiryController')->only(['index', 'destroy', 'store', 'update']);
    Route::get('/enquiry-types', 'EnquiryTypeController@index');

    Route::post('search', 'searchController@index');


    Route::get('/admin/users', 'UserController@index');


    //Route::group(['middleware' => ['WhiteListIp']], function () {
    //    Route::get('/admin/users', 'UserController@index');
    //});


});


Route::post('login', 'Auth\LoginController@login');
//Route::get('logout', 'Auth\LoginController@logout');
Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
Route::post('password/reset', 'Auth\ResetPasswordController@reset');
Route::post('password/confirm', 'Auth\ConfirmPasswordController@confirm');
