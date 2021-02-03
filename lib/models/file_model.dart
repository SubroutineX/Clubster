class FileModel {
  List<String> files;
  String folder;

  FileModel({this.files, this.folder});

  FileModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['files'] = this.files;
    data['folderName'] = this.folder;
    return data;
  }
}

class AssetPathEntity {
  // The albums' ID
  String id;
  // The albums name
  String name;
  // How many assets the album holds
  int assetCount;
  // The album's type
  int albumType;
}
