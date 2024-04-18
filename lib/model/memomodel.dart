import 'dart:convert';

void main() {
  // JSON data representing a list of memos
  String jsonData = '''
  {
      "success": true,
      "data": [
          {
              "first_name": "Kavya",
              "last_name": null,
              "type": "memos",
              "user_id": 3,
              "name": "Heading",
              "description": "all in one",
              "created_at": "2023-09-07T15:08:36.000000Z",
              "id": 1
          },
   
      ],
   
  }
  ''';

  // Parse the JSON data
  Map<String, dynamic> jsonMap = json.decode(jsonData);
  List<dynamic> memoData = jsonMap['data'];

  // Convert JSON data into MemoModel objects
  List<MemoModel> memos =
      memoData.map((data) => MemoModel.fromJson(data)).toList();

  // Print out the parsed memos
  for (var memo in memos) {
    print('Memo ID: ${memo.id}');
    print('Name: ${memo.name}');
    print('Description: ${memo.description}');
    print('Created At: ${memo.createdAt}');
    print('');
  }
}

class MemoModel {
  String firstName;
  String? lastName;
  String type;
  int userId;
  String name;
  String description;
  String createdAt;
  int id;

  MemoModel({
    required this.firstName,
    required this.lastName,
    required this.type,
    required this.userId,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.id,
  });

  factory MemoModel.fromJson(Map<String, dynamic> json) {
    return MemoModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      type: json['type'],
      userId: json['user_id'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
