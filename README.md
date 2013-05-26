#Simple as door notes

Generates static website with oldschool-wiki-like design from markdown file. Each paragraph(s) starting with `##` (2nd lvl header) becames a single page.

## Install on Linux

    sudo apt-get install python3-mako python3-markdown python3-setuptools node-uglify
    sudo easy_install3 sh
    wget --content-disposition http://mabblog.com/getfile.php?file=37
    sudo tar -xvf cssoptimizer_linux.tgz -C /usr/bin ./cssoptimizer

## Usage
### To generate site for local tests:

    python3 build3.py

### To generate site for web:

    python3 build3.py "http://website.url"
