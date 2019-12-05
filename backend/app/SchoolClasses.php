<<<<<<< HEAD
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolClasses extends Model
{
    protected $table = 'schoolclasses';
    
    protected $hidden = [
        'resturant_id',
        'valid'
    ];

    public function resturant()
    {
        return $this->belongsTo('App\Resturant');
    }
}
=======
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolClasses extends Model
{
    protected $table = 'schoolclasses';

    protected $fillable = [
        'name',
        'resturant_id',
        'valid',
    ];
    // protected $hidden = [
    //     'resturant_id',
    //     'valid'
    // ];

    public function resturant()
    {
        return $this->belongsTo('App\Resturant');
    }
}
>>>>>>> 1c4ced3d95c0f7fbb12a988cce89ff4e3eba83d8
