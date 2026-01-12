import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            context.go('/login');
          }
        },
        builder: (context, state) {
          if (state is Authenticated) {
            final user = state.user;
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      (user.displayName ?? 'U').substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.displayName ?? 'User',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.email ?? '',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.info_outline),
                                title: const Text('About'),
                                subtitle: const Text(
                                  'Learn more about this app',
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                                onTap: () {
                                  _showAboutDialog(context);
                                },
                              ),
                              const Divider(height: 1),
                              ListTile(
                                leading: const Icon(Icons.help_outline),
                                title: const Text('Help & Support'),
                                subtitle: const Text('Get help with the app'),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Help & Support coming soon!',
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Divider(height: 1),
                              ListTile(
                                leading: const Icon(Icons.privacy_tip_outlined),
                                title: const Text('Privacy Policy'),
                                subtitle: const Text('Read our privacy policy'),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Privacy Policy coming soon!',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            title: const Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              _showLogoutDialog(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Version 1.0.0',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About ShopApp'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ShopApp adalah aplikasi e-commerce yang menyediakan berbagai produk berkualitas.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('Fitur:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• Kategori produk yang lengkap'),
            Text('• Informasi produk detail'),
            Text('• Rating dan review produk'),
            Text('• User authentication'),
            SizedBox(height: 16),
            Text(
              'Dibuat menggunakan Flutter dengan Bloc state management dan Firebase Authentication.',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthBloc>().add(SignOutRequested());
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
