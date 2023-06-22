# Reproing an issue using esbuild with metascraper

The commands that were run are roughly:

```sh
git init
npm init
yarn set version stable
yarn add metascraper metascraper-author
yarn add --dev esbuild
yarn add argparse
yarn add --dev typescript
yarn exec 'tsc --init'
```

to reprod do:

```sh
yarn run repro
```

which on my machine (MacBookPro16,1, macOS 13.1) yields:

```sh
※ yarn run repro
Building & running lib/index.ts
Building script lib/index.ts
✘ [ERROR] Could not resolve "./build/Release/re2.node"

    node_modules/re2/re2.js:3:20:
      3 │ const RE2 = require('./build/Release/re2.node');
        ╵                     ~~~~~~~~~~~~~~~~~~~~~~~~~~

▲ [WARNING] "./xhr-sync-worker.js" should be marked as external for use with "require.resolve" [require-resolve-not-external]

    node_modules/jsdom/lib/jsdom/living/xhr/XMLHttpRequest-impl.js:31:57:
      31 │ const syncWorkerFile = require.resolve ? require.resolve("./xhr-sync-worker.js") : null;
         ╵                                                          ~~~~~~~~~~~~~~~~~~~~~~

1 warning and 1 error
child_process.js:637
    throw err;
    ^

Error: Command failed: /Users/transverna/code/github/carlgieringer/metascraper-re2-repro/node_modules/@esbuild/darwin-x64/bin/esbuild lib/index.ts --bundle --platform=node --external:esbuild --target=node14 --outfile=dist/lib/index.ts
    at checkExecSyncError (child_process.js:616:11)
    at Object.execFileSync (child_process.js:634:15)
    at Object.<anonymous> (/Users/transverna/code/github/carlgieringer/metascraper-re2-repro/node_modules/esbuild/bin/esbuild:220:28)
    at Module._compile (internal/modules/cjs/loader.js:1063:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1092:10)
    at Module.load (internal/modules/cjs/loader.js:928:32)
    at Function.Module._load (internal/modules/cjs/loader.js:769:14)
    at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:72:12)
    at internal/main/run_main_module.js:17:47 {
  status: 1,
  signal: null,
  output: [ null, null, null ],
  pid: 62862,
  stdout: null,
  stderr: null
}
```
