class YoutubeUtils {
  YoutubeUtils._();

  static String getThumbnail(String? link) {
    if (link == null || !link.contains("youtu")) return "";
    final uri = Uri.tryParse(link);
    if (uri == null) return "";

    String? videoId;

    if (uri.host.contains("youtu.be")) {
      videoId = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
    } else if (uri.host.contains("youtube.com")) {
      videoId = uri.queryParameters['v'];
    }

    return videoId != null
        ? 'https://img.youtube.com/vi/$videoId/0.jpg'
        : '';
  }
}
