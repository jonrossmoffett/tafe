<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Auth;

class AppController extends Controller
{

    public function index()
    {
        return view('home');
    }

    public function CheckAdmin()
    {
        $userRoles = Auth::user()->roles->pluck('name');
        if ($userRoles->contains('admin')) {
            Log::info("user contains admin");
            return ['true'];
        } else {
            return ['false'];
        }
    }
}
