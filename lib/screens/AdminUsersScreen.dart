import 'package:flutter/material.dart';
import '../data/users_data.dart';

class AdminUsersScreen
    extends
        StatefulWidget {
  const AdminUsersScreen({
    super.key,
  });

  @override
  State<
    AdminUsersScreen
  >
  createState() =>
      _AdminUsersScreenState();
}

class _AdminUsersScreenState
    extends
        State<
          AdminUsersScreen
        > {
  // ✅ الحل: بنعدي setState كـ callback للـ dialog
  void _showUserDialog({
    int? editIndex,
  }) {
    final nameController = TextEditingController(
      text:
          editIndex !=
                  null
              ? UsersData.users[editIndex]['name']
              : '',
    );
    final emailController = TextEditingController(
      text:
          editIndex !=
                  null
              ? UsersData.users[editIndex]['email']
              : '',
    );
    final passwordController = TextEditingController(
      text:
          editIndex !=
                  null
              ? UsersData.users[editIndex]['password']
              : '',
    );
    bool isAdmin =
        editIndex !=
                null
            ? UsersData.users[editIndex]['isAdmin']
            : false;

    final formKey =
        GlobalKey<
          FormState
        >();

    showDialog(
      context:
          context,
      builder:
          (
            dialogContext,
          ) => StatefulBuilder(
            builder: (
              dialogContext,
              setDialogState,
            ) {
              final theme = Theme.of(
                dialogContext,
              );
              return AlertDialog(
                title: Text(
                  editIndex !=
                          null
                      ? 'Edit User'
                      : 'Add User',
                  style: const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                content: Form(
                  key:
                      formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [
                        // Name
                        TextFormField(
                          controller:
                              nameController,
                          decoration: InputDecoration(
                            labelText:
                                'Name',
                            prefixIcon: const Icon(
                              Icons.person_outline,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                          validator:
                              (
                                v,
                              ) =>
                                  v ==
                                              null ||
                                          v.isEmpty
                                      ? 'Enter name'
                                      : null,
                        ),
                        const SizedBox(
                          height:
                              16,
                        ),

                        // Email
                        TextFormField(
                          controller:
                              emailController,
                          keyboardType:
                              TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText:
                                'Email',
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                          validator: (
                            v,
                          ) {
                            if (v ==
                                    null ||
                                v.isEmpty)
                              return 'Enter email';
                            if (!v.contains(
                              '@',
                            ))
                              return 'Invalid email';
                            return null;
                          },
                        ),
                        const SizedBox(
                          height:
                              16,
                        ),

                        // Password
                        TextFormField(
                          controller:
                              passwordController,
                          decoration: InputDecoration(
                            labelText:
                                'Password',
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                          validator: (
                            v,
                          ) {
                            if (v ==
                                    null ||
                                v.isEmpty)
                              return 'Enter password';
                            if (v.length <
                                6)
                              return 'Min 6 characters';
                            return null;
                          },
                        ),
                        const SizedBox(
                          height:
                              12,
                        ),

                        // isAdmin toggle
                        Row(
                          children: [
                            const Icon(
                              Icons.admin_panel_settings_outlined,
                            ),
                            const SizedBox(
                              width:
                                  8,
                            ),
                            const Text(
                              'Admin',
                            ),
                            const Spacer(),
                            Switch(
                              value:
                                  isAdmin,
                              activeColor:
                                  theme.colorScheme.primary,
                              onChanged: (
                                val,
                              ) {
                                setDialogState(
                                  () =>
                                      isAdmin =
                                          val,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed:
                        () => Navigator.pop(
                          dialogContext,
                        ),
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          theme.colorScheme.primary,
                      foregroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;

                      final newUser = {
                        'name':
                            nameController.text.trim(),
                        'email':
                            emailController.text.trim().toLowerCase(),
                        'password':
                            passwordController.text.trim(),
                        'isAdmin':
                            isAdmin,
                      };

                      if (editIndex !=
                          null) {
                        await UsersData.updateUser(
                          editIndex,
                          newUser,
                        );
                      } else {
                        await UsersData.addUser(
                          newUser,
                        );
                      }

                      // ✅ setState بتاعت الشاشة الأساسية مش الـ dialog
                      if (mounted)
                        setState(
                          () {},
                        );

                      if (dialogContext.mounted)
                        Navigator.pop(
                          dialogContext,
                        );
                    },
                    child: Text(
                      editIndex !=
                              null
                          ? 'Save'
                          : 'Add',
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }

  void _confirmDelete(
    int index,
  ) {
    showDialog(
      context:
          context,
      builder:
          (
            dialogContext,
          ) => AlertDialog(
            title: const Text(
              'Delete User',
            ),
            content: Text(
              'Are you sure you want to delete "${UsersData.users[index]['name']}"?',
            ),
            actions: [
              TextButton(
                onPressed:
                    () => Navigator.pop(
                      dialogContext,
                    ),
                child: const Text(
                  'Cancel',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(
                        dialogContext,
                      ).colorScheme.error,
                  foregroundColor:
                      Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                onPressed: () async {
                  await UsersData.deleteUser(
                    index,
                  );

                  // ✅ setState بتاعت الشاشة الأساسية مش الـ dialog
                  if (mounted)
                    setState(
                      () {},
                    );

                  if (dialogContext.mounted)
                    Navigator.pop(
                      dialogContext,
                    );
                },
                child: const Text(
                  'Delete',
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );
    final isDark =
        theme.brightness ==
        Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark
              ? const Color(
                0xFF1a1a2e,
              )
              : const Color(
                0xFFF5F5F5,
              ),
      appBar: AppBar(
        title: const Text(
          'Manage Users',
          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
        centerTitle:
            true,
        backgroundColor:
            theme.colorScheme.primary,
        foregroundColor:
            Colors.white,
        elevation:
            0,
      ),
      body:
          UsersData.users.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline,
                      size:
                          60,
                      color:
                          theme.colorScheme.outline,
                    ),
                    const SizedBox(
                      height:
                          16,
                    ),
                    Text(
                      'No users yet',
                      style:
                          theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(
                  16,
                ),
                itemCount:
                    UsersData.users.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  final user =
                      UsersData.users[index];
                  final isAdmin =
                      user['isAdmin'] ==
                      true;

                  return Container(
                    margin: const EdgeInsets.only(
                      bottom:
                          12,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isDark
                              ? const Color(
                                0xFF2d2d44,
                              )
                              : Colors.white,
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.05,
                          ),
                          blurRadius:
                              10,
                          offset: const Offset(
                            0,
                            4,
                          ),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal:
                            16,
                        vertical:
                            8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.primary.withOpacity(
                          0.15,
                        ),
                        child: Text(
                          user['name'][0].toUpperCase(),
                          style: TextStyle(
                            color:
                                theme.colorScheme.primary,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            user['name'],
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          if (isAdmin) ...[
                            const SizedBox(
                              width:
                                  8,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal:
                                    8,
                                vertical:
                                    2,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(
                                  0.1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                              child: Text(
                                'Admin',
                                style: TextStyle(
                                  fontSize:
                                      11,
                                  color:
                                      theme.colorScheme.primary,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      subtitle: Text(
                        user['email'],
                        style: TextStyle(
                          color:
                              isDark
                                  ? Colors.white60
                                  : Colors.grey,
                          fontSize:
                              13,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize:
                            MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit_outlined,
                              color:
                                  theme.colorScheme.primary,
                            ),
                            onPressed:
                                () => _showUserDialog(
                                  editIndex:
                                      index,
                                ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color:
                                  theme.colorScheme.error,
                            ),
                            onPressed:
                                () => _confirmDelete(
                                  index,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:
            () =>
                _showUserDialog(),
        backgroundColor:
            theme.colorScheme.primary,
        foregroundColor:
            Colors.white,
        icon: const Icon(
          Icons.person_add_outlined,
        ),
        label: const Text(
          'Add User',
          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
