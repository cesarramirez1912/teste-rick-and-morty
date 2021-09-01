class InfoModel {
  int count;
  int pages;
  String next;
  String prev;

  InfoModel({this.count, this.pages, this.next, this.prev});

  InfoModel.fromJson({ Map<String, dynamic> json}) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['pages'] = this.pages;
    data['next'] = this.next;
    data['prev'] = this.prev;
    return data;
  }
}
