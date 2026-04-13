import 'package:flutter/material.dart';
import 'users_service.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final service = UsersService();
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await service.getUsers();
    setState(() => users = data);
  }

  void _showEditDialog(Map<String, dynamic> user) async {
    final nameController = TextEditingController(text: user["name"]);
    final emailController = TextEditingController(text: user["email"]);

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              await service.updateUser(
                user["id"],
                nameController.text,
                emailController.text,
              );
              Navigator.pop(context);
              loadUsers();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(users[i]["name"]),
          subtitle: Text(users[i]["email"]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showEditDialog(users[i]),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await service.deleteUser(users[i]["id"]);
                  loadUsers();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nameController = TextEditingController();
          final emailController = TextEditingController();

          await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Add User"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await service.createUser(
                      nameController.text,
                      emailController.text,
                    );
                    Navigator.pop(context);
                    loadUsers();
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
