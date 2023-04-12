VSCODE Configuration Notes
==========================

There are a few ways to run VSCode. If you are writing or modifying Restructured Text files there are a number of things you should install and configure that will greatly assist you.

First install VSCode and get your Github access setup. Install Python, Sphinx and the other requirements memtioned in the How-to.

Then install the following extentions:

- reStructuredText
- reStructuredText Syntax highlighting
- Extension Pack for reStructuredText

The ``settings.json`` file in this folder are base settings to VSCode that will allow functions such as preview and linting of RST files. There are also settings that support the Sphinx render engine. You can either use this file as is or merge the directives into your current settings.json file. 

Witin your repo copy/clone you should place a ``.vscode`` folder and place the settings.json file in this folder. 

If you are using the template repo you can simply rename this folder from ``vscode`` to ``.vscode``
