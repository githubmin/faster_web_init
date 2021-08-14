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

    ```bash
    flutter build web --web-renderer html --release
    ```

- or build for desktop if you need canvaskit but with faster cdn (make sure you put the right version for wasm)

    ```bash
    flutter build web --web-renderer canvaskit --release --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.25.1/bin/
    ```

- ~~split file intto 6 sub files~~

    ```bash
    npx split-file -s main.dart.js 6
    ```

    ~~or using `split` on Unix~~

    ```bash
    split -l 8000 main.dart.js
    ```

- ~~add load script in index.html~~

    ```javascript
    let files = Array.from({length: 6}, (_, i) => `main.dart.js.sf-part${i+1}`);
    let fetches = await Promise.all(files.map(f => fetch(f)));
    let values = await Promise.all(fetches.map(f => f.text()));
    scriptTag.innerHTML = values.join('');
    ```

- add zutf8.js to index.html

    ```html
    <script src="https://cdn.jsdelivr.net/npm/lzutf8@0.6.0/build/production/lzutf8.min.js"></script>
    ```

- compress main.dart.js

    ```bash
    npx lzutf8-file -c main.dart.js main.dart.js.compressed
    ```
- change `main.dart.js` to `main.dart.js.compressed` on index.html

- build it again (to update index.html)

- run!

    ```bash
    npx http-server -c-1
    ```
