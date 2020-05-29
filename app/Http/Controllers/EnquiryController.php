<?php

namespace App\Http\Controllers;

use App\Enquiry;
use App\Http\Resources\EnquiryResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class EnquiryController extends ApiController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        $this->authorize('viewAny', Enquiry::class);

        $length = $request->input('length');
        $column = $request->input('column'); //Index
        $dir = $request->input('dir');
        $searchValue = $request->input('search');

        $columns = ['title', 'name', 'type', 'email', 'phone', 'description'];

        $enquiry = Enquiry::select([

            'enquiries.unique_id',
            'enquiries.title',
            'enquiries.name',
            'enquiries.type as typeId',
            'enquiry_types.name as type',
            'enquiries.email',
            'enquiries.phone',
            'enquiries.description',
            'enquiries.is_solved',
            'enquiries.created_at'

        ])->leftJoin('enquiry_types', 'enquiries.type', '=', 'enquiry_types.id')
            ->where('status', 1)
            ->orderBy($columns[$column], $dir);;

        if ($searchValue) {
            $enquiry->where(function($query) use ($searchValue) {
                $query->where('enquiries.title', 'like', '%' . $searchValue . '%')
                    ->orWhere('enquiries.name', 'like', '%' . $searchValue . '%')
                    ->orWhere('enquiries.email', 'like', '%' . $searchValue . '%')
                    ->orWhere('enquiries.phone', 'like', '%' . $searchValue . '%');
            });
        }

        if(!$this->isAdmin()){
            $enquiry->where('user_id', $this->user()->id);
        }

        if ( $request->input('client') ) {
            return $this->successResponse(EnquiryResource::collection($enquiry->get()));
        }

        return $this->successResponse($enquiry->paginate($length));

    }


    private function validateRequest(Request $request)
    {
        $rules = [
            'title' => 'required|max:255',
            'type' => 'required',
            'email' => 'required',
            'phone' => 'required',
        ];

        return Validator::make($request->all(), $rules);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function store(Request $request)
    {
        $enquiryData = $request->only(['title', 'type', 'email', 'phone', 'description']);
        $enquiryData['unique_id'] = (string)Str::uuid();
        $enquiryData['name'] = $this->user()->name;


        $validator = $this->validateRequest($request);
        if ($validator->fails()) {
            return $this->validationErrorResponse($validator->errors()->toArray());
        }

        $enquiry = $this->user()->enquiry()->create($enquiryData);

        return $this->successResponse(new EnquiryResource($enquiry), "Enquiry Added Successfully ");
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Enquiry $enquiry
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $enquiryUniqueId)
    {
        $validator = Validator::make($request->all(), [
            'type' => 'required', 'is_solved' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->validationErrorResponse($validator->errors()->toArray());
        }

        $enquiry = Enquiry::where('unique_id', $enquiryUniqueId)->first();
        $enquiry->type = $request->type;
        $enquiry->is_solved = $request->is_solved;
        $enquiry->save();

        return $this->successResponse(new EnquiryResource($enquiry), 'Enquiry Updated Successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Enquiry $enquiry
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($enquiryUniqueId)
    {
        $enquiry = Enquiry::where('unique_id', $enquiryUniqueId)->first();

        $enquiry->delete();

        return $this->successResponse($enquiry, 'Enquiry Deleted Successfully');
    }
}
