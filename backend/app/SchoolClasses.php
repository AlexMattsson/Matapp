<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolClasses extends Model
{
    protected $table = 'schoolclasses';

    // protected $hidden = [
    //     'resturant_id',
    //     'valid'
    // ];

    public function resturant()
    {
        return $this->belongsTo('App\Resturant');
    }
}
