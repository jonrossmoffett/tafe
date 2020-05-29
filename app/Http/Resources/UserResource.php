<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'role' => !empty($this->roles->first()) ? ucfirst($this->roles->first()->name)  : '',
            'isAdmin' => !empty($this->roles->first()) ? $this->roles->first()->name == 'admin' : false,
        ];
    }
}
