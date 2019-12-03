<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\SchoolClasses;
use App\Feedback;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        
        $validated = $this->validateRequest($request);
        $resturant = SchoolClasses::find($validated['class'])->resturant;
        // dd($resturant);
        $feedback = Feedback::create([
            'class_id' => $validated['class'],
            'user_id' => $validated['user'],
            'diet' => $validated['diet'],
            'resturant' => $resturant['name'],
            'staff_informed' => $validated['staff_informed'] ?? 0,
            'rating' => $validated['rating'],
            'cause' => $validated['cause'] ?? null,
            'additional_feedback' => $validated['additional_feedback'] ?? null
        ]);
        return [
            "text" => "Feedback has been successfully received",
            "data" => $feedback,
        ];
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
