<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    protected $table = 'feedback';

    protected $fillable = [
        'id',
        'cause',
        'staff_informed',
    ];

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
