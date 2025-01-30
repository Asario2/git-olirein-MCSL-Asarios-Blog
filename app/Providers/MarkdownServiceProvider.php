<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use League\CommonMark\CommonMarkConverter;
use League\CommonMark\Environment\Environment;
use League\CommonMark\Extension\CommonMark\CommonMarkCoreExtension;

class MarkdownServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->singleton(CommonMarkConverter::class, function () {
            $environment = new Environment([
                'html_input' => 'strip', // HTML-Tags entfernen
                'allow_unsafe_links' => false, // Unsichere Links blockieren
            ]);

            $environment->addExtension(new CommonMarkCoreExtension());

            return new CommonMarkConverter([], $environment);
        });
    }
}
