# SIAKAD CI4 Installation Guide (Local Computer)

This guide will help you set up and run the SIAKAD CodeIgniter 4 application on your local computer from start to finish.

## Prerequisites

- PHP 7.4 or higher installed on your computer
- Composer installed (PHP dependency manager)
- MySQL or MariaDB installed and running
- A web server like Apache or Nginx (optional, you can use PHP built-in server)
- Git installed (optional, for cloning the repository)

## Step 1: Clone or Download the Project

If you have Git installed, open your terminal and run:

```bash
git clone <repository-url> siakad-ci4
cd siakad-ci4
```

Alternatively, download the project ZIP and extract it to a folder named `siakad-ci4`.

## Step 2: Install PHP Dependencies

Run the following command in the project root directory to install dependencies:

```bash
composer install
```

If you don't have Composer, download it from https://getcomposer.org/

## Step 3: Configure Environment

Copy the example environment file:

```bash
cp env.example .env
```

Open `.env` in a text editor and set your database connection details:

```
database.default.hostname = localhost
database.default.database = siakad_db
database.default.username = root
database.default.password = 
database.default.DBDriver = MySQLi
```

Adjust username and password as per your MySQL setup.

## Step 4: Create Database

Open your MySQL client (e.g., phpMyAdmin, MySQL Workbench, or command line) and create a new database named `siakad_db` (or the name you set in `.env`).

Example command line:

```sql
CREATE DATABASE siakad_db;
```

## Step 5: Import Database Schema

Import the database schema files located in the `database` folder.

Using command line:

```bash
mysql -u root -p siakad_db < database/master_schema.sql
mysql -u root -p siakad_db < database/schema_additions.sql
```

Replace `root` and `siakad_db` with your MySQL username and database name.

## Step 6: Set Folder Permissions

Make sure the `writable` directory is writable by your web server or PHP process.

On Linux/macOS:

```bash
chmod -R 777 writable
```

## Step 7: Run the Application

You can use PHP's built-in server for development:

```bash
php spark serve
```

This will start the server at `http://localhost:8080`

Alternatively, configure your web server to point to the `public` directory of the project.

## Step 8: Access the Application

Open your web browser and go to:

```
http://localhost:8080
```

You should see the SIAKAD application running.

## Troubleshooting

- Check `writable/logs` for error logs if something goes wrong.
- Ensure PHP extensions required by CodeIgniter 4 are installed (e.g., mbstring, intl, curl).
- Verify database credentials and connection.
- Make sure the web server has permission to read/write necessary folders.

## Additional Tips

- For development, set `CI_ENVIRONMENT = development` in `.env` to enable debugging.
- For production, set `CI_ENVIRONMENT = production`.

## Support

For further help, please contact the development team or refer to CodeIgniter 4 documentation at https://codeigniter.com/user_guide/

---
