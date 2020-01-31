<?php

namespace App\Http\Controllers;

use App\SchoolClasses;
use Illuminate\Http\Request;
use App\Http\Controllers\api\Controller;

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
    
    
    private function validateRequest(Request $request)
    {
        return $this->validate($request, [
            'name' => 'required|string|max:8',
            'resturant_id' => 'required|integer|exists:resturants,id',
        ]);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $this->validateRequest($request);
        $data = SchoolClasses::create($validated);
        return ['Successfully created new class', $data];
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
        SchoolClasses::findOrFail($id)->update($request->all());
        return 'Class successfully updated.';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        SchoolClasses::findOrFail($id)->delete();
        return 'Class successfully removed.';
    }
}
