<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolClasses extends Model
{
    protected $table = 'schoolclasses';

    public function resturant()
    {
        return $this->belongsTo('App\Resturant');
    }
}
