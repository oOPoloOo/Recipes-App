import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class User extends Equatable{
  final String id;
  final String? email;
  final String? name;
  final String? photoUrl;

  const User({required this.id, this.email, this.name, this.photoUrl});

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override 
  List<Object?> get props => [id, email, name, photoUrl];

}