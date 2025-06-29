<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users_rights', function (Blueprint $table) {
            // Boolean‑Feld; default = false (kein Edit‑Recht)
            $table->boolean('xkis_CommentsEdit')
                  ->default(false)
                  ->after('xkis_CommentsCenter');   // ► nach Wunsch anpassen
        });
    }

    public function down(): void
    {
        Schema::table('users_rights', function (Blueprint $table) {
            $table->dropColumn('xkis_CommentsEdit');
        });
    }
};
