<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Laravel\Scout\Searchable;


class Contact extends Model
{
    use Searchable;
    public $timestamps = true;
    protected $guarded = [];

    protected $dates = ['birthday'];

    public function path()
    {
        return '/contacts/' . $this->id;
    }


    public function setBirthdayAttribte($birthday)
    {
        $birthdayConvert = Carbon::createFromFormat('Y-m-d H:i:s', $birthday);
        $this->attributes['birthday'] = $birthdayConvert;
    }

    //protected $hidden = ['created_at', 'updated_at', 'id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
