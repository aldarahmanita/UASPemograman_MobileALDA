import 'package:flutter/material.dart';
import 'package:notestute/data/hive_database.dart';
import 'package:notestute/models/note.dart';

class NoteData extends ChangeNotifier {

  final db = HiveDatabase();

  // overall list of notes
  List<Note> allNotes = [
    
  ];


  void initializeNotes() {
    allNotes = db.loadNotes();
  }

  // get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

  // add a new note
  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  // update note
  void updateNote(Note note, String text) {
    for (int i=0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id){
        allNotes[i].text = text;
      }

    }notifyListeners();
  }

  // delete note
  void deleteNode(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}