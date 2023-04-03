import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_page.dart';
import '../tasks/state/tasks_state_data.dart';
import '../tasks/task_form_page.dart';

class AppModules extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => TaskState())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const HomePage(),
            transition: TransitionType.rightToLeftWithFade),
        ChildRoute('/task-form-screen',
            child: (context, args) => const TaskFormPage(),
            transition: TransitionType.rightToLeftWithFade)
      ];
}
