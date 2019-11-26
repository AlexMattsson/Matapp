<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    public function schoolClass()
    {
        return $this->hasOne('App\SchoolClass');
    }
}
