<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Query\Builder;

class MacroServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     */
    public function boot()
    {
        Builder::macro('filterdefault', function ($filters) {
            if (!empty($filters['search'])) {
                $this->where('name', 'like', '%' . $filters['search'] . '%');
            }
            return $this;
        });
    }

    /**
     * Register any application services.
     */
    public function register()
    {
        //
    }
}
