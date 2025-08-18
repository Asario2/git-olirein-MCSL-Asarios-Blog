<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use RecursiveIteratorIterator;
use RecursiveDirectoryIterator;

class AddMetaHeaderToVue extends Command
{
    protected $signature = 'vue:add-metaheader';
    protected $description = 'Fügt MetaHeader in alle Vue-Dateien im Homepage-Ordner ein, wenn nicht vorhanden.';

    public function handle()
    {
        $basePath = resource_path('js/Application/Homepage');

        $iterator = new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator($basePath)
        );

        foreach ($iterator as $file) {
            if ($file->isFile() && $file->getExtension() === 'vue') {
                $path = $file->getPathname();
                $content = file_get_contents($path);

                if (strpos($content, 'MetaHeader') !== false) {
                    $this->info("Überspringe (bereits vorhanden): {$path}");
                    continue;
                }

                $this->info("Bearbeite: {$path}");

                // 1. Import einfügen
                if (preg_match('/^import.*$/m', $content, $matches)) {
                    $content = preg_replace(
                        '/^import.*$/m',
                        $matches[0] . PHP_EOL . 'import MetaHeader from "@/Application/Homepage/Shared/MetaHeader.vue";',
                        $content,
                        1
                    );
                } else {
                    $content = 'import MetaHeader from "@/Application/Homepage/Shared/MetaHeader.vue";' . PHP_EOL . $content;
                }

                // 2. components sicherstellen
                if (preg_match('/components\s*:\s*{([^}]*)}/m', $content, $matches)) {
                    $componentsBlock = $matches[1];
                    $newBlock = rtrim($componentsBlock) . ', MetaHeader';
                    $content = str_replace($componentsBlock, $newBlock, $content);
                } else {
                    $content = preg_replace(
                        '/export default\s*{/',
                        "export default {\n  components: { MetaHeader },",
                        $content
                    );
                }

                // 3. <MetaHeader ... /> nach <layout> einfügen
                $content = preg_replace(
                    '/(<layout[^>]*>)/i',
                    "$1\n    <MetaHeader title=\"EXAMPLE\" />",
                    $content
                );

                file_put_contents($path, $content);
            }
        }

        $this->info("Fertig ✅");
    }
}
