<?php


namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response as HttpResponse;

class ApiController extends Controller
{

    public function user()
    {

        return $this->auth()->user();
    }

    public function auth()
    {
        return auth('sanctum');
    }

    public function isAdmin(): bool {

        return strtolower($this->user()->roles->first()->name) == 'admin';
    }

    public function validationErrorResponse($messages, $data = [], $responseCode = HttpResponse::HTTP_UNPROCESSABLE_ENTITY)
    {
        return response()->json([
            'data' => $data,
            'errors' => $messages
        ], $responseCode);
    }


    public function successResponse($data, $message = null, $responseCode = HttpResponse::HTTP_OK)
    {

        return response()->json([
            'data' => $data,
            'message' => $message
        ], $responseCode);
    }



    public function errorResponse($message, $data = null, $responseCode = HttpResponse::HTTP_BAD_REQUEST)
    {
        return response()->json([
            'data' => null,
            'message' => $message,
        ], $responseCode);
    }

}
