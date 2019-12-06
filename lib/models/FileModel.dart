class FileModel {
  String _id;
  int length;
  int chunkSize;
  String uploadDate;
  String filename;
  String md5;
  String contentType;
  FileMetadata metadata;

  FileModel.fromJSON(parsedJSON) {
    _id = parsedJSON['_id'];
    length = parsedJSON['length'];
    chunkSize = parsedJSON['chunkSize'];
    uploadDate = parsedJSON['uploadDate'];
    filename = parsedJSON['filename'];
    md5 = parsedJSON['md5'];
    contentType = parsedJSON['contentType'];
    metadata = FileMetadata.fromJSON(parsedJSON['metadata']);
  }

  String get id => _id;
}

class FileMetadata {
  String fieldname;
  String originalname;
  String encoding;
  String mimetype;
  String username;

  FileMetadata.fromJSON(Map<String, dynamic> parsedJSON) {
    fieldname = parsedJSON['fieldname'];
    originalname = parsedJSON['originalname'];
    encoding = parsedJSON['encoding'];
    mimetype = parsedJSON['mimetype'];
    username = parsedJSON['username'];
  }
}
