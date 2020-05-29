<?php

namespace App\Http\Controllers;

use App\Enquiry;
use App\EnquiryType;
use Illuminate\Http\Request;

class EnquiryTypeController extends ApiController
{
    public function index()
    {
        $this->authorize('viewAny', Enquiry::class);

        $enqueryTypes =  EnquiryType::all()->map(function ($enqueryType){
           return [
               'id' => $enqueryType->id,
               'name' => $enqueryType->name,
           ];
        });

        return $this->successResponse($enqueryTypes);
    }
}
