<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Enquiry extends Model
{
    protected $fillable = [
        'title', 'name', 'type', 'email', 'phone', 'description', 'unique_id', 'is_solved'
    ];


    public function types()
    {
        return $this->hasOne(EnquiryType::class, 'id', 'type');
    }
}
