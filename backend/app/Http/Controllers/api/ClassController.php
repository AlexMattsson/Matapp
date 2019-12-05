<<<<<<< HEAD
<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\SchoolClasses;
use Illuminate\Http\Request;

class ClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return SchoolClasses::all();
    }
}
=======
<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\SchoolClasses;
use Illuminate\Http\Request;

class ClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __invoke()
    {
        return SchoolClasses::all();
    }
}
>>>>>>> 1c4ced3d95c0f7fbb12a988cce89ff4e3eba83d8
