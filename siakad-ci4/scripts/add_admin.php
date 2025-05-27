<?php

require_once dirname(__DIR__) . '/vendor/autoload.php';

use App\Models\UserModel;

$userModel = new UserModel();

// Check if user already exists
$existingUser = $userModel->findByUsername('admin@stiealanwar.ac.id');
if ($existingUser) {
    echo "User admin@stiealanwar.ac.id already exists!\n";
    exit(1);
}

// Create new admin user
$data = [
    'username' => 'admin@stiealanwar.ac.id',
    'password' => password_hash('admin123#', PASSWORD_DEFAULT),
    'role' => 'admin'
];

if ($userModel->insert($data)) {
    echo "Admin user created successfully!\n";
} else {
    echo "Failed to create admin user!\n";
    print_r($userModel->errors());
}
