<?php

namespace App\Commands;

use CodeIgniter\CLI\BaseCommand;
use CodeIgniter\CLI\CLI;
use App\Models\UserModel;

class CreateAdmin extends BaseCommand
{
    protected $group       = 'Auth';
    protected $name       = 'auth:create-admin';
    protected $description = 'Creates an admin user';

    public function run(array $params)
    {
        $userModel = new UserModel();
        
        // Check if user already exists
        $existingUser = $userModel->where('username', 'admin@stiealanwar.ac.id')->first();
        if ($existingUser) {
            CLI::write('Admin user already exists!', 'yellow');
            return;
        }

        // Create admin user
        $data = [
            'username' => 'admin@stiealanwar.ac.id',
            'password' => password_hash('admin123#', PASSWORD_DEFAULT),
            'role' => 'admin'
        ];

        if ($userModel->insert($data)) {
            CLI::write('Admin user created successfully!', 'green');
        } else {
            CLI::error('Failed to create admin user!');
            CLI::write(print_r($userModel->errors(), true));
        }
    }
}
