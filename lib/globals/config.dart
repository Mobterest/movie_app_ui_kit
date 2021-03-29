const String YOUR_API_KEY = '25f3721115f875f8c8ca5545244437b2';
const String TRENDING_URL =
    'https://api.themoviedb.org/3/trending/all/day?api_key=' + YOUR_API_KEY;
const String IMAGE_URL = "https://image.tmdb.org/t/p/w500";
const String LOADING_IMG = 'assets/loading.gif';
const String POPULAR_URL =
    "https://api.themoviedb.org/3/movie/popular?api_key=" +
        YOUR_API_KEY +
        "&language=en-US&page=1";
const String GENRE_URL =
    "https://api.themoviedb.org/3/genre/movie/list?api_key=" +
        YOUR_API_KEY +
        "&language=en-US";
const String REVIEWS_NO_URL =
    "https://api.themoviedb.org/3/movie/MOVIE_ID/reviews?api_key=" +
        YOUR_API_KEY +
        "&language=en-US&page=1";
const String DEFAULT_GENRE = 'Action';
const String UPCOMING_URL =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=' +
        YOUR_API_KEY +
        '&language=en-US&page=1';
const String CREDITS_URL =
    'https://api.themoviedb.org/3/movie/MOVIE_ID/credits?api_key=' +
        YOUR_API_KEY;
const String CURRENCY = '\$';
const String CAST_URL = 'https://api.themoviedb.org/3/person/CAST_ID?api_key=' +
    YOUR_API_KEY +
    '&language=en-US';
const String MOVIE_CREDIT_URL =
    'https://api.themoviedb.org/3/person/CAST_ID/movie_credits?api_key=' +
        YOUR_API_KEY +
        '&language=en-US';
const String CAST_IMG_URL =
    'https://api.themoviedb.org/3/person/CAST_ID/images?api_key=' +
        YOUR_API_KEY;
