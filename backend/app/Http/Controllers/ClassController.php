<?php

namespace App\Http\Controllers;

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
        return view('class.index', ['data' => SchoolClasses::all()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $class = SchoolClasses::findOrFail($id);
        if(!$class) {
            return abort(404, 'Class not found.');
        }
        $class->update($request->all());
        return $class;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $class = SchoolClasses::findOrFail($id);
        if(!$class) {
            return abort(404, 'Class not found.');
        }
        $class->delete();
        return 'Class successfully removed.';
    }
}
