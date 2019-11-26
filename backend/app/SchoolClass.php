<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolClasses extends Model
{
    public function resturant()
    {
        return $this->hasOne('App\Resturant');
    }
}
