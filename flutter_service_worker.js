'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "bd872e16d1cc223aa14fc746aa5662a9",
"favicon.ico": "1e47061113f80ea551898c0e24a3953d",
"index.html": "3e3520c082b9432852db5ea3f07a04c4",
"/": "3e3520c082b9432852db5ea3f07a04c4",
"main.dart.js": "512bee66ca09f0877d956b71d4ef5d17",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d97404eac3fcb5ace66825db94ff2140",
".git/config": "fccf3b300359552470bd18899ca68d83",
".git/objects/0d/5aafe1964cae8d5dd9d7da0447612e4c22d01c": "fc5712cac5430830227441424e4e69b7",
".git/objects/32/54bc04340dc4919ab59b039a907cf51648fe8c": "761b94148f07ab0f14f15eba2947675e",
".git/objects/32/ba2b2371d493a1fd108d9e0536579ce940a6d6": "7ea163b9361ac26d1b6d1ecac7db1957",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/69/839ca4a66a87d8c8fdefb996a22848312f9f1c": "f19cf659c393f9770490af1d332815e3",
".git/objects/58/ea1712b15a8559fb8119d1edeba9af59bd0899": "c55ccb64f936752c69f2909d9fcd37bc",
".git/objects/67/07d372bf880b8a07f6b07233f82ce207572143": "c3c949fca2c1cdbba8329addda688d22",
".git/objects/33/98ae8c5c5fb7bb8ecad6e286cb7fb6e06a9ada": "cf35b0965f24719a3220d8bb4a5a6bf3",
".git/objects/9d/5f886353dcff6c222439cc1118e77eb1b007ea": "a87ff240c6e149d1ce495643e49417f9",
".git/objects/a4/378727315f8c3602008ffbc10993c652df4d4c": "204d8ce4453408c67489e94030528d35",
".git/objects/b5/0d01aa78c767a77e2985c2b89dcb5ab41c8955": "8164f16096c3de22cd1282818cdb3106",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "d7280a766a5d6033f187d874a92b5ad6",
".git/objects/be/17d74268262d809316dee45f3af2fcf3b372a0": "0c7e144cc86f4f0cd4aa2c7153ecadf4",
".git/objects/b3/14b802ca892e4379c8e4469e5337995c4f39b8": "1a4562b01b4c310983a6649ffe64167f",
".git/objects/df/7d2dcb89ab89da87467c0e1059b38c8d8f9296": "a44162ff357b024e4638ab18a9bb01c7",
".git/objects/a2/ee06e4440134f7a0488d3fcf42e46eb3b84736": "b05c8ed864b63f6f3fdc29a105663156",
".git/objects/a2/ea5d467b889b40118638fc3c6415aa371672a3": "9abf65a77f14ec79d4b7f2a727f6efef",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/ab/5f4f4e40256fe573d49e20e6485a5b30c74978": "7074ff01fa7dbb513aad14a33611c48a",
".git/objects/e2/ff5865b192241d53935e77de70a4e6dff2847a": "cad1058aedc6c21a518b3cb00af21fac",
".git/objects/f3/95de042626672e94e5c04fd76706b90e572fb5": "c8d8e579ce833e88156449578e2cab14",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c9/b38626ac2aae9c195ed77114fc0ec2ca1e4c39": "c9655a5d0a5fcda34d9678649d7f4f40",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "6e5bf2450330342c243afc3723b9c27e",
".git/objects/f2/a9ebe4b87aeb270f3e61901e0fd2d49d98d178": "5bb49236bfa7c5b31950a3c2276b6d7d",
".git/objects/ca/cccda7a786ee423fbb10ccaba723ce976dda93": "bacec4f4cf97a2542692b1048ec7929d",
".git/objects/c8/5beb9ee6deb2413d352685a257dd1fb17e5056": "4bd5a9d66d99106bfdefa9abe90b8a9a",
".git/objects/42/a80a325d29c629269ab206d3fe3f20a4734cc2": "f44f0a720eaad6438c5f605606784ccb",
".git/objects/89/94e48296ed609156f80c6929f05104cf22a5ce": "8dcce8fbbf59bfb77b72ffc3d080b933",
".git/objects/89/a418e2f3acdd3878dba0985eef3930cac79396": "bc1f14437b8ae93a65f20165d8bde013",
".git/objects/45/e59deef77e2f828547ab09a7756ee392c0bbad": "a04948fdaa0218653d0f096925eb16b4",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8a/d41123112dcc05e645c65693277074ac106233": "3de645de309caa9346a728f03e403fdd",
".git/objects/72/d3a6508c0900dcd33bfa4246382306f1fe1770": "2587eae0b6716d8fcb41c566277b29c9",
".git/objects/43/2388a9dff42406eddc9828fe8a953f7c4f311d": "21663731d3cd696dd8735121761aafa8",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/88/899656bfdf569bf3ceafed116c13120104ee60": "a198838cea517609f288297d2a32f26f",
".git/objects/00/552816465ec3afb5c20e5cf6a8993524b71537": "98df064cefbe3780b394b9d61d80b690",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "970aec5149a3dbe9370a9dc982cdd022",
".git/objects/53/d2ad4fbbf69712366d870f455011165a85131c": "b8f6d2deea5dd37af00b1f7f89fb56a2",
".git/objects/6c/1e1b5619f6a73695bdad0b7933991504bb113a": "37d0f1e9e5b441c09cd1ece7d73925be",
".git/objects/55/f71664068b60900e49440e4f0c79abf43167cb": "2f60fdb65dc787eb651ab867c4bd57b6",
".git/objects/97/b9e1be70c49cb17af001629e4cec19f22985c4": "a97b8010f35d65254f124fa80dc2d777",
".git/objects/63/f79b62e6aad75683053011da7f1dcc533921bc": "bc5a3d567381347d44781610019f2eef",
".git/objects/bf/fd30ac08c176d587f06bee31dea6319041a2bd": "70b6abe5b07c45cf4ca0725e886041f9",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/a7/cbe6fd26bc4b6d0a220b86df24c57d56dd90e8": "a8f055489f6962afddcff906b11058cf",
".git/objects/d5/462f3e51be60e051a1f6fe13d6b5990a448666": "7cba3eda9bb87bce85e94a45a33de05a",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "943e27e1d359e2bc22daf20c70287c19",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c3/fc11b62fe0d2ccffa9ce13c78d5790f96df260": "f3649ea2119def7a321e1d7376fce416",
".git/objects/ea/f527e4565d5d21dd0f7f13995713f5400d5b13": "bae97b3c5eb506a91c9a68d50ca69cfb",
".git/objects/e6/8f691f5d942b371d84d3926c9169571ac85f4d": "f31fa40b9e893d6ac7aa453c6f42611b",
".git/objects/e6/980c278b2df9d2f44aaf8b6c010b6faab97a87": "573521b07a4b2692266fedd57dd88d0f",
".git/objects/e6/46d591f99adb142edab348e5d728ad2bddc4a3": "7630b34441d494db3bf4d884cd250e72",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "2933b2b2ca80c66b96cf80cd73d4cd16",
".git/objects/e6/4ffa70942c11d1d09f6f0d9ce4695f57cdffd8": "9531425b9469d4b9e26152df86b1ec55",
".git/objects/fa/81d0cc454e3cb76ad2b16e97d09d6e390c48ba": "9190dbcf22d3f0b88a877e19fbdd02ae",
".git/objects/c5/2c94fa675fdfa55da0f0aee539ebc7331d9677": "738b8c8eac98b7ad742bf28ee2ad9a2c",
".git/objects/c2/d8d2f44dd987786bbc249d4ad7bac3360f4811": "1926a57b256d9def261ccf6dc2914f65",
".git/objects/f8/b022eabd057d0c8e9c92c4afdcc38e176952e3": "9b57b7ad97fe5084d13590118e2ee7ae",
".git/objects/e0/49c81f7cb35ebc411a3e1b547bf4ccf91292e8": "efad70dc0ca77a90ee53b5cc3be528ca",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/48/4c5b5d7acf2a35415c8281bcc9da2470098c74": "8cb8a1b5b41d70cd272eef6db18ae647",
".git/objects/2b/7e4586709ced0ef56925579064eff4d811bb44": "a3abe4a6fc1aec4a8ff7af65ea9a1943",
".git/objects/47/7863e9ae31abf6eef6c7bf9a6f00d11bece837": "5647b4c7ff0bd9423c93ceb375b165bb",
".git/objects/8e/c43e14ec2684b380ddf563a717a83c810f84c4": "f963828c315ddb06c8814bca627bebf4",
".git/objects/22/8e45f6e552f1be2dda9a57d6239411aaeb91f8": "3c2fe6e21df5e267f9d2fec35e67ed74",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "fb0a533ef34b51e09546deb57c2a1576",
".git/logs/refs/heads/master": "9a38a98392479183cfbd0a50b0a70ce9",
".git/logs/refs/remotes/origin/master": "678ef304d16a53b086852e243c3594df",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/master": "0fab529a9ae6aeb2f4c70305f804535b",
".git/refs/remotes/origin/master": "0fab529a9ae6aeb2f4c70305f804535b",
".git/index": "b6c2f7d2fc8ad500c4a6dbcbf5d89db7",
".git/COMMIT_EDITMSG": "6711cd88bfaae664e5fa823e753c9f14",
"assets/AssetManifest.json": "3757c452eb1afa5fc3a59e51698d625e",
"assets/NOTICES": "6db822393160ebdf1eb35f9656b8c8fa",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "bd44a82079ff21f619d1c00b99d430a2",
"assets/fonts/MaterialIcons-Regular.otf": "c295650707b64ef236a2b1036de8affe",
"assets/assets/images/klondike-sprites.png": "96dc56353d56d5a1ea8089d0b0a1ad0a",
"assets/assets/audio/shuffle-cards.mp3": "ab1db9811bb4b76c765636269b1678a8",
"assets/assets/audio/win.mp3": "f6770e81732fb5ca80c374cf73c36c95",
"assets/assets/audio/flip-card.mp3": "627d63daada33a47cadbbd7c1c10c008",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
