<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginRegisterController extends Controller
{
    public function authenticate(Request $request)
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            return redirect()->route('welcome');
        }

        return redirect()->back()->withErrors(['email' => 'Credenciales inválidas'])->withInput();
    }

    public function showWelcome()
    {
        if (Auth::check()) {
            return view('welcome');
        } else {
            return redirect()->route('login.showForm');
        }
    }

    public function showLoginForm()
    {
        return view('auth.login_register');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('home');
    }


}
