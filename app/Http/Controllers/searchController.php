<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Contact;
use App\Http\Resources\Contact as ContactResource;

class searchController extends Controller
{
    public function index()
    {
        Log::info("index reached");
        $data = request()->validate([
            'searchTerm' => 'required',
        ]);
        $contacts = Contact::search($data['searchTerm'])->get()->where('user_id', request()->user()->id);
        return ContactResource::collection($contacts);
    }
}
