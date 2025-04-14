<?php

namespace App\Services;

class DarkModeService
{
    public function getDefaultValue(): bool
    {
        return config('design.darkmode_default', false);
    }
}
