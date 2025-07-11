<?php
// app/Mail/WelcomeMail.php
namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactMail extends Mailable
{
    use Queueable, SerializesModels;

    public $domain;
    public $url;
    public $nickname;
    public $content;

    public function __construct($domain, $name,$email,$subject,$content)
    {
        // dd($request);
        $this->domain = $domain;
        $this->nickname = $name;
        $this->content = $content;
        $this->mail = $email;
        $this->subject = $subject;
    }

    public function build()
    {
        return $this->subject($this->subject)
                ->markdown('emails.contact')
                ->with([
                    'domain' => $this->domain,
                    'email'=>$this->mail,
                    'subject'=>$this->subject,
                    'nickname'=>$this->nickname,
                    'content' => $this->content,
                ]);
    }
}
