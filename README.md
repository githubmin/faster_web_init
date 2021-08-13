# faster_web_init

Make flutter web load more faster.

## Articles

- [Fix Flutter web loading time with a loading spinner](https://itnext.io/fix-flutter-web-loading-time-with-a-loading-spinner-c5dd36a29f5b)

- [Flutter Web: Should I use it? (Part 2 — Performance)](https://remelehane.dev/posts/flutter-web-should-i-use-it-part-2/)

- [Flutter Web 常见问题及兼容性处理](https://juejin.cn/post/6955745398153543693)

## Steps

- add css & loading spinner in index.html

- build for mobile browser with faster cdn

    ```shell
    flutter build web  --web-renderer html --release --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.24.0/bin/
    ```
