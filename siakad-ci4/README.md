# SIAKAD CI4 Installation Guide

This guide will help you set up and run the SIAKAD CodeIgniter 4 application on your local machine or server.

## Prerequisites

- PHP 7.4 or higher
- Composer
- MySQL or compatible database
- Web server (Apache, Nginx, or built-in PHP server)

## Installation Steps

1. **Clone the repository**

```bash
git clone <repository-url> siakad-ci4
cd siakad-ci4
```

2. **Install dependencies**

```bash
composer install
```

3. **Configure environment**

- Copy `.env.example` to `.env`

```bash
cp env.example .env
```

- Edit `.env` file to set your database connection details:

```
database.default.hostname = localhost
database.default.database = siakad_db
database.default.username = your_db_user
database.default.password = your_db_password
database.default.DBDriver = MySQLi
```

4. **Create the database**

- Create a new database named `siakad_db` (or the name you set in `.env`).

5. **Import database schema**

- Import the schema files located in `siakad-ci4/database/`:

```bash
mysql -u your_db_user -p siakad_db < database/master_schema.sql
mysql -u your_db_user -p siakad_db < database/schema_additions.sql
```

6. **Set folder permissions**

- Ensure `writable` directory is writable by the web server.

7. **Run the application**

- Using PHP built-in server:

```bash
php spark serve
```

- Or configure your web server to point to the `public` directory.

8. **Access the application**

- Open your browser and go to:

```
http://localhost:8080
```

## Additional Notes

- Default user roles and authentication are managed in the application.
- For development, enable debug mode in `.env` by setting:

```
CI_ENVIRONMENT = development
```

- For production, set:

```
CI_ENVIRONMENT = production
```

## Troubleshooting

- Check `writable/logs` for error logs.
- Ensure PHP extensions required by CodeIgniter 4 are installed.

## Contact

For further assistance, please contact the development team.

---
