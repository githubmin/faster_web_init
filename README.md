# faster_web_init

Make flutter web load more faster.

## Articles

- [Fix Flutter web loading time with a loading spinner](https://itnext.io/fix-flutter-web-loading-time-with-a-loading-spinner-c5dd36a29f5b)

- [Flutter Web: Should I use it? (Part 2 — Performance)](https://remelehane.dev/posts/flutter-web-should-i-use-it-part-2/)

- [Flutter Web 常见问题及兼容性处理](https://juejin.cn/post/6955745398153543693)

## Steps

- add css & loading spinner in index.html

- remove 'cupertino_icons' in pubspec.yaml if not used

- remove 'uses-material-design' in pubspec.yaml if no needed

- build for mobile browser using html renderer

    ```shell
    flutter build web --web-renderer html --release
    ```

- or build for desktop if you need canvaskit but with faster cdn (make sure you put the right version for wasm)

    ```shell
    flutter build web --web-renderer canvaskit --release --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.25.1/bin/
    ```
