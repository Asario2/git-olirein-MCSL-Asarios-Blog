<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class ConvertShortpoemTimestamps extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:convert-shortpoem-timestamps';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        DB::table('shortpoems')->get()->each(function ($row) {
            DB::table('shortpoems')
                ->where('id', $row->id)
                ->update([
                    'created_at' => \Carbon\Carbon::createFromTimestamp($row->date),
                    'updated_at' => \Carbon\Carbon::createFromTimestamp($row->chg_date),
                ]);
        });

        $this->info('Zeitstempel erfolgreich konvertiert.');
    }

}
