<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use App\Models\Blog;
use Spatie\Sitemap\Sitemap;
use Spatie\Sitemap\Tags\Url;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class ExecuteSitemapCreation extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sitemap:generate';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Automatically Generate an XML Sitemap';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $sitemap = Sitemap::create();
        //
        $sitemap->add(Url::create('/home')
                ->setLastModificationDate(Carbon::yesterday())
                ->setChangeFrequency(Url::CHANGE_FREQUENCY_YEARLY)
                ->setPriority(0.6));
        //
        $sitemap->add(Url::create('/get_started')
                ->setLastModificationDate(Carbon::yesterday())
                ->setChangeFrequency(Url::CHANGE_FREQUENCY_YEARLY)
                ->setPriority(0.7));
        //
        Blog::whereDate('blog_date', '<=', Carbon::now())->get()->each(function (Blog $blog) use ($sitemap) {
            $sitemap->add(
                Url::create("/blogs/show/{$blog->autoslug}")
                    ->setLastModificationDate(Carbon::yesterday())
                    ->setPriority(0.9)
                    ->setChangeFrequency(Url::CHANGE_FREQUENCY_MONTHLY)
            );
        });
        //
        $sitemap->writeToFile(public_path('sitemap.xml'));
        //
        // Log::info('ExecuteSitemapCreation');
        //
        $this->newLine();
        $this->info('Der Befehl sitemap:generate wurde ausgeführt.');
        //
        return 0;
    }
}
