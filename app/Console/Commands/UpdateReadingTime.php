<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Blog;

class UpdateReadingTime extends Command
{
    protected $signature = 'blogs:update-reading-time';
    protected $description = 'Berechnet die Lesezeit für alle Blogposts und speichert sie in der DB';

    public function handle()
    {
        $blogs = Blog::all();
        $wordsPerMinute = 190;

        foreach ($blogs as $blog) {
            $wordCount = str_word_count(strip_tags($blog->content)); // HTML-Tags entfernen und Wörter zählen
            $readingTime = ceil($wordCount / $wordsPerMinute); // Aufrunden auf volle Minuten

            $blog->reading_time = $readingTime;
            $blog->save();

            $this->info("Updated Blog ID {$blog->id} with reading time: {$readingTime} minutes");
        }

        $this->info('Reading times updated for all blog posts.');
    }
}
