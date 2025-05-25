<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class CleanComments extends Command
{
    protected $signature = 'clean:comments';
    protected $description = 'Bereinigt das content-Feld in comments und erlaubt nur <br> Tags';

    public function handle()
    {
        $comments = DB::table('comments')->get();

        foreach ($comments as $comment) {
            $original = $comment->content;
            $cleaned = html_entity_decode(strip_tags($original, '<br>'));

            $this->line("ID: {$comment->id}");
            $this->info("Original: {$original}");
            $this->info("Bereinigt: {$cleaned}");
            $this->line(str_repeat('-', 40));

            // Optional: Wenn du direkt in der DB speichern willst, aktiviere die nächste Zeile:
            DB::table('comments')->where('id', $comment->id)->update(['content' => $cleaned]);
        }

        $this->info("Alle Kommentare wurden bearbeitet.");
    }
}
