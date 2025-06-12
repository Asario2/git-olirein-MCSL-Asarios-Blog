<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use Carbon\Carbon;
use DateTime;
class PersonalController
{
    /**
     * Validate and update the given user's profile information.
     *
     * @param  array<string, mixed>  $input
     */
    public function update(Request $request)
    {
        $user = auth()->user(); // oder direkt injizieren, wenn Route z. B. /user/{user} nutzt


        $dateString = $request->input('birthday'); // z.B. '31.12.2023'

        \Log::info('Raw birthday input: ' . $dateString);

        $request['birthday'] = date("Y-m-d 00:00:00",strtotime($dateString));
        $validated = $request->validate([
            'birthday' => ['nullable', 'date', 'before:today'],
            'music' => ['nullable', 'string', 'max:255'],
            'occupation' => ['nullable', 'string', 'max:255'],
            'about' => ['nullable', 'string'],
            'interests' => ['nullable', 'string', 'max:255'],
            'fbd'=>['nullable','string','max:200'],
        ], [], [], 'updateProfileInformation');

        \Log::info("✅ Empfangen:", $validated);

        $user->forceFill([
            'birthday' => $validated['birthday'] ?? null,
            'music' => $validated['music'] ?? null,
            'occupation' => $validated['occupation'] ?? null,
            'about' => $validated['about'] ?? null,
            'interests' => $validated['interests'] ?? null,
            'fbd'=>$validated['fbd'],
            'updated_at' => now(),
        ])->save();
    return response()->json(["success"=>true,"Messsage"=>"Profil gespeichert"]);
    }


    /**
     * Update the given verified user's profile information.
     *
     * @param  array<string, string>  $input
     */
    protected function updateVerifiedUser(User $user, array $input): void
    {
        $user->forceFill([
            'first_name' => $input['first_name'],
            'name' => $input['name'],
            'birthday' => $input['birthday'],
            'interests' => $input['interests'],
            'occupation' => $input['occupation'],
            'about' => $input['about'] ?? null,
            'music' => $input['music'],
            'email' => $input['email'],
            'email_verified_at' => null,
            "updated_at"=>NOW(),
        ])->save();

        $user->sendEmailVerificationNotification();
    }
}
