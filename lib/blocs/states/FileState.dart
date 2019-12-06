import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/FileModel.dart';

class FileState extends Equatable {
  @override
  List<Object> get props => [];
}

class FileInitial extends FileState {
  final List<FileModel> list;

  FileInitial({this.list = const []});
}

class FileLoading extends FileState {}

class FileFailure extends FileState {}
