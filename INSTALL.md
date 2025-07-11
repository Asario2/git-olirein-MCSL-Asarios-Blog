![MCSL Logo](public/MCSL.jpg)
# Installation
1. Install `XAMPP/LAMPP`
2. Install `node/js`
3. Install `composer`
4. download the repository and copy the content to `htdocsc/Yourpath` or `www/Yourpath` directory  
5. import the `tables.sql` into your MySql/MariaDB database
6.  run a shell in `htdocs/Yourpath` or `www/Yourpath` and run `npm install`
7. Run a shell in Yourpath and execute `composer install` & `composer update`
8. run this in a shell: `cp .env.example .env`
9. customize the DB values in .env   
**-Example:**  
    DB_CONNECTION=mysql  
    DB_HOST=127.0.0.1  
    DB_PORT=3306  
    DB_DATABASE=yourdb
    DB_USERNAME=root  
    DB_PASSWORD=mypasswort  
11. run `php artisan key:generate` in a shell
12. run `php artisan storage:link` in shell
13. run `npm run dev` & `php artisan serve -host 0.0.0.0 --port 80`
14. resolve all dependencies
15. log in with the values e-mail: `admin@example.com` and password: `TE6a9qpQ2pB47eqa8UjY`.
16. have fun
