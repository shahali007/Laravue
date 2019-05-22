<?php

namespace App\Http\Controllers\API;

use App\User;
use function GuzzleHttp\Promise\all;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Hash;
use Image;

class UserController extends Controller
{
    /**
    |--------------------------
    | Constructor Function
    |--------------------------
    */
    public function __construct()
    {
        $this->middleware('auth:api');
    }


    /**
    |--------------------------
    | Index Function
    |--------------------------
    */
    public function index()
    {
        return User::latest()->paginate(50);
    }


    /**
    |--------------------------
    | Show Function
    |--------------------------
    */
    public function store(Request $request)
    {
        //dd($request->all());
         $request->validate([
            'name'          => 'required|max:191|',
            'email'         => 'required|string|email|max:255|unique:users',
            'type'          => 'required',
            'password'      => 'required|string|min:6|confirmed',
        ]);

        return User::create([
            'name'          => $request['name'],
            'email'         => $request['email'],
            'type'          => $request['type'],
            'password'      => Hash::make($request['password']),
        ]);
    }


    /**
    |--------------------------
    | Show Function
    |--------------------------
    */
    public function show($id)
    {
        //
    }


    /**
    |--------------------------
    | Profile Function
    |--------------------------
    */
    public function profile(){
        return auth('api')->user();
    }


    /**
    |--------------------------
    | Update Function
    |--------------------------
    */
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $request->validate([
            'name'          => 'required|max:191|',
            'email'         => 'required|string|email|max:191|unique:users,email,'.$user->id,
            'type'          => 'required',
            'password'      => 'sometimes|min:6|confirmed',
        ]);

        $user->name         = $request['name'];
        $user->email        = $request['email'];
        $user->type         = $request['type'];
        if ($request['password']){
            $user->password = Hash::make($request['password']);
        }
        $user->save();
    }


    /**
    |--------------------------
    | Update Profile Function
    |--------------------------
    */
    public function updateProfile(Request $request)
    {
        $user = auth('api')->user();
        $request->validate([
            'name'          => 'required|max:191|',
            'email'         => 'required|string|email|max:191|unique:users,email,'.$user->id,
        ]);
        $user->name         = $request['name'];
        $user->email        = $request['email'];

        $currentPhoto       = $user->photo;
        if ($request->photo !=$currentPhoto){
            $name = str_replace(' ', '-', $user->name).'-'.time().'.'.explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];
            Image::make($request->photo)->save(public_path('/images/profile/').$name);
            $user->photo      = $name;

            $userPhoto = public_path('/images/profile/').$currentPhoto;
            if (file_exists($userPhoto)){
                @unlink($userPhoto);
            }
        }
        //$user->photo      = $request->photo;
        $user->save();
        return ['msg' => 'updated!'];
    }


    /**
    |--------------------------
    | Delete Function
    |--------------------------
    */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
    }
}
