<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Str;

class ConvertSql extends Command
{
    protected $signature = 'convert:sql {file : Pfad zur SQL-Datei}';
    protected $description = 'Konvertiert Umlaute in HTML-Entities und ersetzt <br />\\n durch <br /> in einer SQL-Datei';

    public function handle()
    {
        $inputFile = $this->argument('file');

        if (!file_exists($inputFile)) {
            $this->error("❌ Datei nicht gefunden: $inputFile");
            return Command::FAILURE;
        }

        $content = file_get_contents($inputFile);

        $replacements = [
            'ä' => '&auml;',
            'ö' => '&ouml;',
            'ü' => '&uuml;',
            'Ä' => '&Auml;',
            'Ö' => '&Ouml;',
            'Ü' => '&Uuml;',
            'ß' => '&szlig;',
        ];
        $content = RUMLAUT($content);
        $converted = strtr($content, $replacements);

        // <br />\n → <br />
        $converted = preg_replace('/<br\s*\/>\s*\n/', '<br />', $converted);
        $converted = preg_replace('/<br\/>\s*\n/', '<br />', $converted);

        $outputFile = Str::replaceLast('.sql', '_converted.sql', $inputFile);

        file_put_contents($outputFile, $converted);

        $this->info("✅ Datei erfolgreich konvertiert: $outputFile");
        return Command::SUCCESS;
    }
}
