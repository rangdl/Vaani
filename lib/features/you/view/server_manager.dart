import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/api/api_provider.dart' show makeBaseUrl;
import 'package:vaani/api/authenticated_users_provider.dart'
    show authenticatedUsersProvider;
import 'package:vaani/api/server_provider.dart'
    show ServerAlreadyExistsException, audiobookShelfServerProvider;
import 'package:vaani/features/onboarding/view/user_login.dart'
    show UserLoginWidget;
import 'package:vaani/features/player/view/mini_player_bottom_padding.dart'
    show MiniPlayerBottomPadding;
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/router/router.dart' show Routes;
import 'package:vaani/settings/api_settings_provider.dart'
    show apiSettingsProvider;
import 'package:vaani/settings/models/models.dart' as model;
import 'package:vaani/shared/extensions/obfuscation.dart' show ObfuscateSet;
import 'package:vaani/shared/widgets/add_new_server.dart' show AddNewServer;

class ServerManagerPage extends HookConsumerWidget {
  const ServerManagerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).accountManage),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ServerManagerBody(),
        ),
      ),
    );
  }
}

class ServerManagerBody extends HookConsumerWidget {
  const ServerManagerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registeredServers = ref.watch(audiobookShelfServerProvider);
    final registeredServersAsList = registeredServers.toList();
    final availableUsers = ref.watch(authenticatedUsersProvider);
    final apiSettings = ref.watch(apiSettingsProvider);
    final serverURIController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    appLogger.fine('registered servers: ${registeredServers.obfuscate()}');
    appLogger.fine('available users: ${availableUsers.obfuscate()}');

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          S.of(context).accountRegisteredServers,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: registeredServers.length,
            reverse: true,
            itemBuilder: (context, index) {
              var registeredServer = registeredServersAsList[index];
              return ExpansionTile(
                title: Text(registeredServer.serverUrl.toString()),
                subtitle: Text(
                  S.of(context).accountUsersCount(
                        availableUsers
                            .where(
                                (element) => element.server == registeredServer)
                            .length,
                      ),
                  // 'Users: ${availableUsers.where((element) => element.server == registeredServer).length}',
                ),
                // children are list of users of this server
                children: availableUsers
                    .where(
                      (element) => element.server == registeredServer,
                    )
                    .map<Widget>(
                      (e) => AvailableUserTile(user: e),
                    )
                    .nonNulls
                    .toList()

                  // add buttons of delete server and add user to server at the end
                  ..addAll([
                    AddUserTile(server: registeredServer),
                    DeleteServerTile(server: registeredServer),
                  ]),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(S.of(context).accountAddNewServer),
        ),
        Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: AddNewServer(
            controller: serverURIController,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                try {
                  final newServer = model.AudiobookShelfServer(
                    serverUrl: makeBaseUrl(serverURIController.text),
                  );
                  ref.read(audiobookShelfServerProvider.notifier).addServer(
                        newServer,
                      );
                  ref.read(apiSettingsProvider.notifier).updateState(
                        apiSettings.copyWith(
                          activeServer: newServer,
                        ),
                      );
                  serverURIController.clear();
                } on ServerAlreadyExistsException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).accountInvalidURL),
                  ),
                );
              }
            },
          ),
        ),
        MiniPlayerBottomPadding(),
      ],
    );
  }
}

class DeleteServerTile extends HookConsumerWidget {
  const DeleteServerTile({
    super.key,
    required this.server,
  });

  final model.AudiobookShelfServer server;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.delete),
      title: Text(S.of(context).accountDeleteServer),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(S.of(context).accountRemoveServerAndUsers),
              // Make content scrollable in case of smaller screens/keyboard
              content: SingleChildScrollView(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).accountRemoveServerAndUsersHead,
                      ),
                      TextSpan(
                        text: server.serverUrl.host,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: S.of(context).accountRemoveServerAndUsersTail,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).cancel),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .read(
                          audiobookShelfServerProvider.notifier,
                        )
                        .removeServer(
                          server,
                          removeUsers: true,
                        );
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).delete),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class AddUserTile extends HookConsumerWidget {
  const AddUserTile({
    super.key,
    required this.server,
  });

  final model.AudiobookShelfServer server;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.person_add),
      title: Text(S.of(context).accountAddUser),
      onTap: () async {
        await showDialog(
          context: context,
          // barrierDismissible: false, // Optional: prevent closing by tapping outside
          builder: (dialogContext) {
            // Use a different context name to avoid conflicts
            return AlertDialog(
              title: Text(
                S.of(context).accountAddUserDialog(server.serverUrl.host),
              ),
              // Make content scrollable in case of smaller screens/keyboard
              content: SingleChildScrollView(
                child: UserLoginWidget(
                  server: server.serverUrl,
                  // Pass the callback to pop the dialog on success
                  onSuccess: (user) {
                    // Add the user to the server
                    ref.read(authenticatedUsersProvider.notifier).addUser(user);
                    Navigator.of(dialogContext).pop(); // Close the dialog
                    // Optional: Show a confirmation SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text(S.of(context).accountAddUserSuccessDialog),
                        action: SnackBarAction(
                          label: 'Switch',
                          onPressed: () {
                            // Switch to the new user
                            ref.read(apiSettingsProvider.notifier).updateState(
                                  ref.read(apiSettingsProvider).copyWith(
                                        activeUser: user,
                                      ),
                                );
                            context.goNamed(Routes.home.name);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Close the dialog
                  },
                  child: Text(S.of(context).cancel),
                ),
              ],
            );
          },
        );
        // No need for the SnackBar asking to switch user here anymore.
      },
    );
  }
}

class AvailableUserTile extends HookConsumerWidget {
  const AvailableUserTile({
    super.key,
    required this.user,
  });

  final model.AuthenticatedUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiSettings = ref.watch(apiSettingsProvider);

    return ListTile(
      selected: apiSettings.activeUser == user,
      leading: apiSettings.activeUser == user
          ? const Icon(Icons.person)
          : const Icon(Icons.person_off_outlined),
      title: Text(user.username ?? S.of(context).accountAnonymous),
      onTap: apiSettings.activeUser == user
          ? null
          : () {
              ref.read(apiSettingsProvider.notifier).updateState(
                    apiSettings.copyWith(
                      activeUser: user,
                    ),
                  );
              // pop all routes and go to the home page
              // while (context.canPop()) {
              //   context.pop();
              // }
              context.goNamed(
                Routes.home.name,
              );
            },
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(S.of(context).accountRemoveUserLogin),
                content: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).accountRemoveUserLoginHead,
                      ),
                      TextSpan(
                        text: user.username ?? S.of(context).accountAnonymous,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: S.of(context).accountRemoveUserLoginTail,
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      ref
                          .read(
                            authenticatedUsersProvider.notifier,
                          )
                          .removeUser(user);
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).delete),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
