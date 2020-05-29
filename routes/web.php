<?php

use Illuminate\Support\Facades\Route;



Route::get('/{any}', 'AppController@index')->where('any', '.*');

/* For URL of mail, Default mail uses 'password.reset' named route. so create a dummy one*/
Route::post('reset-password', function (){ abort(404); })->name('password.reset');


//Route::post('api/logout', 'Auth\LoginController@logout')->name('logout');
//Route::post('register', 'Auth\RegisterController@register');
//Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
//Route::post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.update');
//Route::post('password/confirm', 'Auth\ConfirmPasswordController@confirm');
//Route::post('email/resend', 'Auth\VerificationController@resend')->name('verification.resend');
