<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;


class AuthController extends Controller
{
    public function index()
    {
        return view('login');
    }


    /**
     * Store a new user.
     *
     * @param  Request  $request
     * @return Response
     */

    public function register(Request $request)
    {
        //validate incoming request 
        $this->validate($request, [
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed',
            'resturant_id' => 'required|integer|exists:resturants,id',
        ]);

        try {

            $user = new User;
            $user->name = $request->input('name');
            $user->email = $request->input('email');
            $plainPassword = $request->input('password');
            $user->password = app('hash')->make($plainPassword);
            $user->resturant_id = $request->input('resturant_id');
            $user->save();

            //return successful response
            return response()->json(['user' => $user, 'message' => 'CREATED'], 201);
        } catch (\Exception $e) {
            //return error message
            return response()->json(['message' => 'User Registration Failed!', $e], 409);
        }
    }

    /**
     * Get a JWT via given credentials.
     *
     * @param  Request  $request
     * @return Response
     */
    public function login(Request $request)
    {
        //validate incoming request 
        $this->validate($request, [
            'email' => 'required|string',
            'password' => 'required|string',
        ]);

        $credentials = $request->only(['email', 'password']);

        if (!$token = Auth::attempt($credentials)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $user = User::where('email', $request->only('email'))->first();
        $user->api_token = $token;
        $user->save();

        return $this->respondWithToken($token);
    }

    public function logout(Request $request)
    {
        if (isset($_COOKIE['token'])) {
            return redirect('/auth')->withCookie(Cookie::forget('token'));
        }

        return redirect('/auth');
    }
}
