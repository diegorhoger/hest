import 'package:flutter/material.dart';

import '../../components/custom_text_field.dart';
import '../../config/app_data.dart' as app_data;
import '../../config/custom_colors.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        children: [
          // User Name
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),

          // User Email
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.email,
            icon: Icons.email,
            label: 'Email',
          ),

          // Password
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.password,
            icon: Icons.lock,
            label: 'Senha',
            isSecret: true,
          ),

          // Edit Button
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: CustomColors.customSwatchColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Atualizar Informações',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {
                updateProfile();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updateProfile() {
    return showDialog(
      context: context,
      builder: (context) {
        var mediaQuery = MediaQuery.of(context);

        return SingleChildScrollView(
          padding: mediaQuery.padding,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),

                            // Title
                            child: Text(
                              'Atualizar Informações',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      // Name
                      const CustomTextField(
                        icon: Icons.person,
                        label: 'Nome',
                      ),

                      // Email
                      const CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                      ),

                      // Password
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha Atual',
                        isSecret: true,
                      ),

                      // New Password
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Nova Senha',
                        isSecret: true,
                      ),

                      // Confirm New Password
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Confirmar Nova Senha',
                        isSecret: true,
                      ),

                      // Update Button
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Atualizar',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Close Button
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
