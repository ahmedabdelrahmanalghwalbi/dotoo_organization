/*
Clean Architecture is a software design principle that aims to separate concerns and dependencies between different layers of an application. In a Flutter app with the BLoC (Business Logic Component) pattern, the Clean Architecture can be implemented by dividing the app into three main layers: the Domain layer, the Data layer, and the Presentation layer.

1. Domain Layer:
The Domain layer represents the core of your application. It contains the business logic and rules of your app, which are independent of any framework or external dependencies. This layer should be framework-agnostic and reusable. It typically consists of entities, use cases (interactors), and repositories interfaces.

- Entities: These are plain Dart classes that represent the core business objects and contain the business logic.
Example:
dart
class User {
  final String id;
  final String name;
  
  User({required this.id, required this.name});
}
- Use Cases (Interactors): These are classes that contain the core business logic and use the repositories to perform operations. They define the actions that can be performed in your app.
Example:
dart
class GetUserUseCase {
  final UserRepository userRepository;
  
  GetUserUseCase({required this.userRepository});
  
  Future<User> execute(String userId) {
    return userRepository.getUser(userId);
  }
}
- Repository Interfaces: These are abstract classes or interfaces that define the contract for data operations. They provide an abstraction layer between the domain and data layers.
Example:
dart
abstract class UserRepository {
  Future<User> getUser(String userId);
}
2. Data Layer:
The Data layer is responsible for handling data operations, such as fetching data from APIs, databases, or other external sources. It implements the repository interfaces defined in the Domain layer. This layer should not have any business logic and should be independent of UI and framework-specific code. It typically consists of data sources, repositories, and mappers.

- Data Sources: These classes handle the actual data retrieval from external sources, such as APIs or databases.
Example:
dart
class ApiDataSource {
  Future<Map<String, dynamic>> getUserData(String userId) async {
    // Fetch user data from API
  }
}
- Repositories: These classes implement the repository interfaces defined in the Domain layer. They use the data sources to retrieve and manipulate data.
Example:
dart
class UserRepositoryImpl implements UserRepository {
  final ApiDataSource apiDataSource;
  
  UserRepositoryImpl({required this.apiDataSource});
  
  @override
  Future<User> getUser(String userId) async {
    final userData = await apiDataSource.getUserData(userId);
    return User(id: userData['id'], name: userData['name']);
  }
}
- Mappers: These classes are responsible for mapping data between different formats or models.
Example:
dart
class UserMapper {
  User fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name']);
  }
}
3. Presentation Layer:
The Presentation layer handles the UI and user interactions. It is responsible for rendering the views, receiving user input, and communicating with the Domain layer through the use cases. It consists of widgets, BLoCs, and UI-specific mappers.

- Widgets: These are the UI components that display the views and handle user interactions.
Example:
dart
class UserPage extends StatelessWidget {
  final GetUserUseCase getUserUseCase;
  final String userId;
  
  UserPage({required this.getUserUseCase, required this.userId});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: getUserUseCase.execute(userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            return Text(user.name);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
- BLoCs: These classes handle the business logic and state management of the app. They communicate with the Use Cases in the Domain layer to perform operations and update the UI.
Example:
dart
class UserBloc {
  final GetUserUseCase getUserUseCase;
  
  final _userController = StreamController<User>();
  Stream<User> get userStream => _userController.stream;
  
  UserBloc({required this.getUserUseCase});
  
  void getUser(String userId) async {
    try {
      final user = await getUserUseCase.execute(userId);
      _userController.sink.add(user);
    } catch (e) {
      _userController.sink.addError(e);
    }
  }
  
  void dispose() {
    _userController.close();
  }
}
- UI-specific Mappers: These classes are responsible for mapping data from the domain entities to UI-specific models or formats.
Example:
dart
class UserUIModelMapper {
  UserUIModel fromEntity(User user) {
    return UserUIModel(id: user.id, displayName: user.name);
  }
}
By following the Clean Architecture principles, you can achieve a well-organized, modular, and testable codebase. The separation of concerns between the layers allows for easier maintenance, scalability, and flexibility in your Flutter BLoC app.
*/