# Reproduction case for partial DWARF information

This is a reproduction case for the problem of partial DWARF information, where
we only have debuginfo for a subset of the functions in a Wasm module. In this
case Chromium DevTools is going to silently step over all functions that don't
have DWARF information, which is not the user experience that we would like to
have.

## Building

This was only tested on Ubuntu / Debian. You'll need to make sure that you installed `clang-8` and `lld-8` packages, i.e.

```console
sudo apt-get install clang-8 lld-8
```

Afterwards just build with

```console
make
```

start the web server with

```console
make start
```

and point your browser to [`http://localhost:4000`](http://localhost:4000).
