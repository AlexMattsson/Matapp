<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    protected $guarded = [
        'id',
    ];

    protected $hidden = [
        'id',
        'user_id',
    ];

    public function schoolClass()
    {
        return $this->hasOne('App\SchoolClass');
    }
}
