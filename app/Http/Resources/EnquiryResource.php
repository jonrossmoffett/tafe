<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EnquiryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'unique_id' => $this->unique_id,
            'title' => $this->name,
            'name' => $this->name,
            'type' => isset($this->types) ? $this->types->name : '',
            'email' => $this->email,
            'phone' => $this->phone,
            'description' => $this->description,
        ];
    }
}
