import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/services/news_services.dart';

import '../models/news_model.dart';

part 'news_provider.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(true) bool isLoading,
    required NewsModel newsModel,
  }) = _NewsState;

  const NewsState._();
}

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(NewsState(newsModel: NewsModel(articles: []))) {
    loadNews();
  }

  loadNews() async {
    state = state.copyWith(isLoading: true);
    final newsResponse = await NewsServices().fetchNews();
    final news = NewsModel.fromJson(newsResponse);
    state = state.copyWith(newsModel: news, isLoading: false);
  }

  loadSearchNews(String title) async {
    state = state.copyWith(isLoading: true);
    final newsResponse = await NewsServices().fetchNewsBySearching(title);
    final news = NewsModel.fromJson(newsResponse);
    state = state.copyWith(newsModel: news, isLoading: false);
  }
}

final newsProvider = StateNotifierProvider<NewsNotifier, NewsState>(
  (ref) => NewsNotifier(),
);
