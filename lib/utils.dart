String getFullIconUrl(String iconUrl) {
  if (iconUrl.startsWith('//')) {
    return 'https:$iconUrl';
  } else if (iconUrl.startsWith('http://') || iconUrl.startsWith('https://')) {
    return iconUrl;
  } else {
    return 'https://cdn.weatherapi.com$iconUrl';
  }
}
