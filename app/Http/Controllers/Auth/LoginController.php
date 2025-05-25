<?php
namespace App\Http\Controllers\Auth;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Helpers\GoogleAuthenticatorHelper;
use Illuminate\Filesystem\FilesystemServiceProvider;
use App\Http\Controllers\DarkModeController;
use App\Http\Controllers\GlobalController;
class LoginController extends Controller
{
    function __construct(Request $request)
    {
        if(!session_id())
        {
            session_start();
        }
        GlobalController::SetDomain();
        $dma = NEW DarkModeController();

    }
    // Show the 2FA form after successful password login
    public function showTwoFactorForm()
    {
        // Make sure the user is authenticated but not yet 2FA authenticated
        // if (!Auth::user() ) {
        //     return redirect()->route('home');
        // }

        return view('auth.two-factor');
    }

    // Verify the OTP code entered by the user
    public function verifyTwoFactor(Request $request)
    {
        $user = Auth::user();

        $userId = $request->session()->get('2fa:user:id');
        $user = User::find($userId);
        // echo "<pre>";
        // var_dump($user->google2fa_secret);
        // exit;
        if (!$user) {
            return "user not found";
            return redirect()->route('login')->withErrors(['message' => 'User not found.']);
        }
        $otp = $request->input('token');
        $user->updated_at = now();
        // Verify the OTP code
        if (GoogleAuthenticatorHelper::verifyCode($user->google2fa_secret, $otp)) {
            $user->is_two_factor_authenticated = true;
            $user->two_factor_authenticated = true;

            $user->save();
            Auth::login($user);

            // return "not verfified";
            return redirect()->route('home')->with('status', 'Successfully authenticated with 2FA.');
        }

        return back()->withErrors(['otp' => 'Invalid OTP code.']);
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
    public function showLoginForm()
    {
        return view('auth.login');  // Ensure 'auth.login' points to your login view
    }

    // protected function validateLogin(Request $request)
    // {
    //     $request->validate([
    //         'email' => 'required|email',
    //         'password' => 'required',
    //     ]);
    // }
    protected function redirectPath()
    {
        return '/home'; // Oder eine andere Route, zu der Sie nach der Anmeldung weiterleiten möchten
    }
    protected function sendFailedLoginResponse(Request $request)
    {
        throw ValidationException::withMessages([
            'email' => ['Diese Anmeldeinformationen stimmen nicht mit unseren Unterlagen überein.'],
        ]);
    }
    public function login(Request $request)
    {

        if (!Auth::attempt($request->only('email', 'password'))) {
            return response([
                'message' => 'Invalid Response',
            ], Response::HTTP_UNAUTHORIZED);
        }

        $user = Auth::user();
        $credentials = $request->only('email', 'password');

        // Attempt to authenticate the user
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            Auth::login($user);
            // Check if the user has 2FA enabled
            if ($user->two_factor_enabled) {
                // Store user's ID in session and redirect to 2FA form
                Session::put('2fa:user:id', $user->id);
                Auth::logout();  // Log out the user until 2FA is verified
                return redirect()->route('auth.two-factor');
            }
            else{

            }


        }
// If no 2FA, proceed with login
return redirect()->intended('dashboard');
}
}
