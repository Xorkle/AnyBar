# AnyBar-icons: OS X menubar status indicator

AnyBar-icons is a fork of [AnyBar](https://github.com/tonsky/AnyBar) which adds support for icons from [icons8.com](http://www.icons8.com). AnyBar-icons is a small indicator for your menu bar that displays a dot of specified color or any icon from icons8.com. What the dot or icon means and when to change it is up to you.

<img src="screenshot.png?raw=true" />

## Usage

AnyBar is controlled via a UDP port (1738 by default). Before any commands can be sent, AnyBar.app must be launched:

```sh
open -a AnyBar
```

Once launched, you may send it a message to change the color of the dot:

```sh
echo -n "black" | nc -4u -w0 localhost 1738
```

Or set a custom icon from icons8.com by passing it's id:
```sh
echo -n "679" | nc -4u -w0 localhost 1738
```

The following default commands change the style of the dot:

<img src="AnyBar/Resources/white@2x.png?raw=true" width=19 /> `white`  
<img src="AnyBar/Resources/red@2x.png?raw=true" width=19 /> `red`  
<img src="AnyBar/Resources/orange@2x.png?raw=true" width=19 /> `orange`  
<img src="AnyBar/Resources/yellow@2x.png?raw=true" width=19 /> `yellow`  
<img src="AnyBar/Resources/green@2x.png?raw=true" width=19 /> `green`  
<img src="AnyBar/Resources/cyan@2x.png?raw=true" width=19 /> `cyan`  
<img src="AnyBar/Resources/blue@2x.png?raw=true" width=19 /> `blue`  
<img src="AnyBar/Resources/purple@2x.png?raw=true" width=19 /> `purple`  
<img src="AnyBar/Resources/black@2x.png?raw=true" width=19 /> `black`  
<img src="AnyBar/Resources/question@2x.png?raw=true" width=19 /> `question`  
<img src="AnyBar/Resources/exclamation@2x.png?raw=true" width=19 /> `exclamation`  

And one special command forces AnyBar to quit: `quit`

## Alternative clients

Bash alias:

```sh
$ function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }

$ anybar red
$ anybar green 1739
```

Zsh with completion:

- [wookayin/anybar-zsh](https://github.com/wookayin/anybar-zsh)

Go:

- [justincampbell/anybar](https://github.com/justincampbell/anybar)
- [johntdyer/anybar-go](https://github.com/johntdyer/anybar-go)

Node:

- [rumpl/nanybar](https://github.com/rumpl/nanybar)
- [sindresorhus/anybar](https://github.com/sindresorhus/anybar)
- [snippet by skibz](https://github.com/tonsky/AnyBar/issues/11)

PHP:

- [2bj/Phanybar](https://github.com/2bj/Phanybar)

Java:

- [cs475x/AnyBar4j](https://github.com/cs475x/AnyBar4j)

Python:

- [philipbl/pyanybar](https://github.com/philipbl/pyAnyBar)

Ruby:

- [davydovanton/AnyBar_rb](https://github.com/davydovanton/AnyBar_rb)

Rust:

- [urschrei/rust_anybar](https://github.com/urschrei/rust_anybar)
- [Feliix42/anybar-rs](https://github.com/Feliix42/anybar-rs)

Nim:

- [rgv151/anybar.nim](https://github.com/rgv151/anybar.nim)

Erlang:

- [kureikain/ebar](https://github.com/kureikain/ebar)

C:

- [onderweg/anybar-cli](https://github.com/onderweg/anybar-cli)

C#:

- [jenyayel/anybar-client](https://github.com/jenyayel/anybar-client)

Crystal:
- [davydovanton/AnyBar_cr](https://github.com/davydovanton/AnyBar_cr)

Emacs: 

- [rmuslimov/anybar.el](https://gist.github.com/rmuslimov/2d74cacd5e0ae827663e)
- [tie-rack/anybar-el](https://github.com/tie-rack/anybar-el) (Also on [Melpa](http://melpa.org/#/anybar))

AppleScript:

```
tell application "AnyBar" to set image name to "blue"

tell application "AnyBar" to set current to get image name as Unicode text
display notification current
```

Alfred:

- [https://github.com/raguay/MyAlfred](https://github.com/raguay/MyAlfred/blob/master/AnyBarWorkflow.alfredworkflow)

## Integrations

- Webpack build status plugin [roman01la/anybar-webpack](https://github.com/roman01la/anybar-webpack)
- boot-clj task [tonsky/boot-anybar](https://github.com/tonsky/boot-anybar)
- Idea plugin [denofevil/AnyBarIdea](https://github.com/denofevil/AnyBarIdea)
- Anybar-based CLI journal [Andrew565/anybar-icon-journal](https://github.com/Andrew565/anybar-icon-journal)
- Command monitoring [rvirani1/with_anybar](https://github.com/rvirani1/with_anybar)
- Extension for ipython/jupyter/ipython notebook [ermakovpetr/ipython-anybar](https://github.com/ermakovpetr/ipython-anybar)

## Running multiple instances

You can run several instances of AnyBar as long as they listen on different ports. Use the `ANYBAR_PORT` environment variable to change the port and `open -na` to run several instances:

```sh
ANYBAR_PORT=1738 open -na AnyBar
ANYBAR_PORT=1739 open -na AnyBar
ANYBAR_PORT=1740 open -na AnyBar
```

## Custom images

AnyBar can detect and use local custom images stored in the `~/.AnyBar` directory. For example, if you have a `~/.AnyBar/square@2x.png` image, send `square` to port 1738 and it will be displayed. Images should be 19×19 pixels for standard resolution, and 38x38 pixels for retina (@2x).

## Changelog

### 0.1.5

- Support for icons from [icons8.com](http://www.icons8.com)

### 0.1.4

- Bigger dots
- Render “black” on dark menubar as empty circle and “white” on dark as filled circle (#55)
- Compiled for OS X 10.11

### 0.1.3

- AppleScript support (PR #8, thx [Oleg Kertanov](https://github.com/okertanov))

### 0.1.2

- Dark mode support. In dark mode AnyBar will first check for `<image>_alt@2x.png` or `<image>_alt.png` image first, then falls back to `<image>.png`
- Support for Mavericks actually works

### 0.1.1

- Support for Mavericks (PR #2, thx [Oleg Kertanov](https://github.com/okertanov))
- Support for custom images via ~/.AnyBar (PR #1, thx [Paul Boschmann](https://github.com/pboschmann))

## License

Copyright © 2015 Nikita Prokopov

Licensed under Eclipse Public License (see [LICENSE](LICENSE)).
