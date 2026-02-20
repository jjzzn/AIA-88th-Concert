// Generate bcrypt password hashes for admin users
// Run: node generate-admin-passwords.js

const bcrypt = require('bcryptjs');

const users = [
  { username: 'admin1', password: 'admin123' },
  { username: 'admin2', password: 'admin123' },
  { username: 'superadmin', password: 'superadmin123' }
];

console.log('\n=== Admin Password Hashes ===\n');

users.forEach(user => {
  const hash = bcrypt.hashSync(user.password, 10);
  console.log(`Username: ${user.username}`);
  console.log(`Password: ${user.password}`);
  console.log(`Hash: ${hash}`);
  console.log(`\nSQL Update:`);
  console.log(`UPDATE admin_users SET password_hash = '${hash}' WHERE username = '${user.username}';\n`);
  console.log('---\n');
});

console.log('Copy the SQL UPDATE statements above and run them in Supabase SQL Editor\n');
