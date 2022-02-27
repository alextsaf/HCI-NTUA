import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';

class BookmarkedAssistantsViewModel extends ChangeNotifier {
  late AssistantRepository _repository;

  List<Assistant> get assistants => _repository.savedAssistants;

  void save(Assistant assistant) {
    _repository.savedAssistants.add(assistant);
    notifyListeners();
  }

  void remove(Assistant assistant) {
    assistants.remove(assistant);
    notifyListeners();
  }

  BookmarkedAssistantsViewModel(AssistantRepository repository) {
    _repository = repository;
  }
}