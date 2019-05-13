<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*
 *
 * Clear
 *
 */
/*clear view, config, route, cache*/
Route::get('/clear', function () {
    return view('clear.clear');
});
Route::get('/all-clear', function () {
    \Illuminate\Support\Facades\Artisan::call('view:clear');
    \Illuminate\Support\Facades\Artisan::call('cache:clear');
    \Illuminate\Support\Facades\Artisan::call('config:clear');
    \Illuminate\Support\Facades\Artisan::call('route:clear');
    //return 'View Cleared';
    return redirect()->back()->with('clearMsg', 'All Clear (view, cache, route, config)');
});
Route::get('/clear-view', function () {
    \Illuminate\Support\Facades\Artisan::call('view:clear');
    return redirect()->back()->with('clearMsg', 'View cleared');
});
Route::get('/clear-cache', function () {
    \Illuminate\Support\Facades\Artisan::call('cache:clear');
    return redirect()->back()->with('clearMsg', 'Cache cleared');
});

Route::get('/clear-route', function () {
    \Illuminate\Support\Facades\Artisan::call('route:clear');
    return redirect()->back()->with('clearMsg', 'Route cleared');
});

Route::get('/clear-config', function () {
    \Illuminate\Support\Facades\Artisan::call('config:clear');
    return redirect()->back()->with('clearMsg', 'Config cleared');
});

Route::get('/', function () {
    return view('welcome');
});
Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

Route::get('/{vue_capture?}', function () { return view('home'); })->where('vue_capture', '[\/\w\.-]*');