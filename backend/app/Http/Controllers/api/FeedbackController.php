<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $validated = $this->validateRequest($request);
        
    }

    private function validateRequest(Request $request)
    {
        return $this->validate($request, [
            'class' => 'required|integer|exists:schoolclasses,id',
            'diet' => 'required|string|max:24',
            'user' => 'required|string|max:36',
            
            'staff_informed' => 'nullable|boolean',
            'rating' => 'required|integer|max:4',
            'cause' => 'nullable|string|max:20',
            'additional_feedback' => 'nullable|string|max:128',
        ]);
    }
}
