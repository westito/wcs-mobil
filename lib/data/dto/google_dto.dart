class GoogleDto {
  final String imageUrl;

  GoogleDto.fromJson(Map<String, dynamic> json)
      // ignore: avoid_dynamic_calls
      : imageUrl = json['items'][0]['pagemap']['metatags'][0]['twitter:image']
            as String;
}
