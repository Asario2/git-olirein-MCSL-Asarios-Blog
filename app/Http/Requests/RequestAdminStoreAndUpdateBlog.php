<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestAdminStoreAndUpdateBlog extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        $rules = [];

        $rules['blog_authors_id'] = ['required', 'exists:blog_authors,id'];
        $rules['blog_categories_id'] = ['required', 'exists:blog_categories,id'];
        $rules['image_path'] = ['required', 'max:255'];
        $rules['blog_date'] = ['required', 'date'];
        $rules['title'] = ['required', 'max:100'];
        $rules['summary'] = ['required', 'min:10'];
        //
        if ($this->markdown_on == false) {
            $rules['content'] = ['required', 'min:10'];
        }
        //
        if ($this->audio_on == true) {
            $rules['audio_url'] = ['required', 'max:100'];
            $rules['audio_duration'] = ['required', 'numeric'];
        }
        //
        return $rules;
    }

    public function messages()
    {
        return [
            'blog_authors_id.required' => 'Bitte gebe den Autor ein.',
            'blog_authors_id.exists' => 'Der ausgewählte Autor ist nicht vorhanden.',
            'blog_categories_id.required' => 'Bitte gebe die Kategorie ein.',
            'blog_categories_id.exists' => 'Die ausgewählte Kategorie ist nicht vorhanden.',
            'image_path.required' => 'Bitte wähle ein Artikelbild aus.',
            'image_path.exists' => 'Das ausgewählte Artikelbild ist nicht vorhanden.',
            'blog_date.required' => 'Bitte gebe das Artikeldatum ein.',
            'blog_date.date' => 'Bitte ein gültiges Artikeldatum ein.',
            'title.required' => 'Bitte gebe den Titel des Blogartikels ein.',
            'title.max' => 'Für die Eingabe des Blogartikel-Titels stehen maximal 100 Zeichen zur Verfügung.',
            'summary.required' => 'Bitte gebe die Zusammenfassung des Blogartikels ein.',
            'summary.min' => 'Bitte gebe für die Zusammenfassung des Blogartikels mindestens 10 Zeichen ein.',
            'content.required' => 'Bitte gebe den Artikelinhalt ein.',
            'content.min' => 'Bitte gebe für den Artikelinhalt mindestens 10 Zeichen ein.',
            //
            'audio_url.required' => 'Bitte gebe den Namen der Audio-Datei ein.',
            'audio_url.max' => 'Für die Eingabe des Audio-Dateinamens stehen maximal 100 Zeichen zur Verfügung.',
            'audio_duration.required' => 'Bitte gebe die Länge der Audio-Datei in Sekunden ein.',
            'audio_duration.numeric' => 'Der eingegebene Wert in "Audiodauer in Sekunden" ist kein gültiger Wert.',
        ];
    }
}
