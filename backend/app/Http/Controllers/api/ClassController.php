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
