<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Contact;
use Illuminate\Support\Facades\Auth;
use PHPUnit\Util\Json;
use App\Http\Resources\Contact as ContactResource;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Log;


class ContactsController extends ApiController
{

    //public function index()
    //{
    //    return Contact::all();
    //}

    public function index()
    {
        $this->authorize('viewAny', Contact::class);

        return $this->successResponse( ContactResource::collection(request()->user()->contacts) );

    }

    public function store()
    {
        $this->authorize('create', Contact::class);
        $contact = request()->user()->contacts()->create($this->validateData());

        return (new ContactResource($contact))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }


    public function show(Contact $contact)
    {
        if ($this->authorize('view', $contact)) {
            //Log::info("authorised");
            return new ContactResource($contact);
        }
        //$this->authorize('view', $contact);
        //return new ContactResource($contact);
    }

    public function update(Contact $contact)
    {
        $this->authorize('update', $contact);
        $contact->update($this->validateData());

        return (new ContactResource($contact))->response()->setStatusCode(Response::HTTP_OK);
    }

    public function destroy(Contact $contact)
    {
        $this->authorize('delete', $contact);
        $contact->delete();
        return response([], response::HTTP_NO_CONTENT);
    }

    private function validateData()
    {
        return request()->validate([
            'name' => 'required',
            'email' => 'required|email',
            'birthday' => 'required:date',
            'company' => 'required'
        ]);
    }
}
