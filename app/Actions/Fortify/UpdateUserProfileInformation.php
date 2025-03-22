<?php

namespace App\Actions\Fortify;

use App\Models\User;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Laravel\Fortify\Contracts\UpdatesUserProfileInformation;

class UpdateUserProfileInformation implements UpdatesUserProfileInformation
{
    /**
     * Validate and update the given user's profile information.
     *
     * @param  array<string, mixed>  $input
     */
    public function update(User $user, array $input): void
    {
        // Wenn $input ein Array ist, verwende es direkt
        $inputData = $input;

        // Merge birthday field
        $inputData = array_merge($inputData, [
            'birthday' => $inputData['birthday'] ?? null, // Verwende den Null-Coalescing-Operator
        ]);

        // Validierung
        Validator::make($inputData, [
            'first_name' => ['required', 'string', 'max:255'],
            'name' => ['required', 'string', 'max:255'],
            'birthday' => ['nullable', 'string', 'before:today'],
            'music' => ['nullable', 'string', 'max:255'],
            'occupation' => ['nullable', 'string', 'max:255'],
            'interests' => ['nullable', 'string', 'max:255'], // Korrigierte Schreibweise von 'interests'
            'email' => ['required', 'email', 'max:255', Rule::unique('users')->ignore($user->id)],
            'photo' => ['nullable', 'mimes:jpg,jpeg,png', 'max:1024'],
        ])->validateWithBag('updateProfileInformation');
        if (isset($input['photo'])) {
            $user->updateProfilePhoto($input['photo']);
        }

        if (
            $input['email'] !== $user->email &&
            $user instanceof MustVerifyEmail
        ) {
            $this->updateVerifiedUser($user, $input);
        } else {
            $user->forceFill([
                'first_name' => $input['first_name'],
                'name' => $input['name'],
                'music' => $input['music'],
                'interests' => $input['interests'],
                'occupation' => $input['occupation'],
                'birthday' => $input['birthday'],
                'email' => $input['email'],
            ])->save();
        }
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
            'music' => $input['music'],
            'email' => $input['email'],
            'email_verified_at' => null,
        ])->save();

        $user->sendEmailVerificationNotification();
    }
}
