Lab 1.1 - Setup
===============

Minimun Requirements
--------------------

No matter what you're daily driver is you'll need `Docker` and `Git`.

.. note:: We recommend some sort of Linux shell. This can be done with Windows
   but you'll need to overcome several hurdles.

- For Linux use apt (or whatever package tool) to download and install:

  .. code-block:: bash

     sudo apt update
     sudo apt install git
     sudo apt install docker-ce

- For Windows download the following and install:

  - `Git for Windows <https://git-scm.com/download/win>`_

  - `Docker Desktop for Windows <https://hub.docker.com/editions/community/docker-ce-desktop-windows/>`_

Configure Git
-------------

Now that Git's installed we need to configure it for basic use. From your
terminal of choice run the following git commands:

.. code-block:: bash

   git config --global user.name "vtog"
   git config --global user.email "v.tognaci@f5.com"
   git config --global core.editor vim

.. attention:: Be sure to use your user name, email, and editor of choice.

You'll also want to setup ssh auth with you're github account. For details on
how to configure this see the following,
`Connecting to GitHub with SSH <https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh>`_

Clone Your Repo
---------------

Now that Git's installed and configured we need to clone the repo from GitHub

#. Open a terminal
#. Clone your repo

   .. code-block:: bash

      git clone git@github.com:f5devcentral/f5-agility-labs-template.git

#. When using the git clone as shown above it will clone the repo's default
   branch. If a specific branch is required you have two options:

   - use the "-b" switch when creating the clone

     .. code-block:: bash

        git clone -b develop git@github.com:f5devcentral/f5-agility-labs-template.git

   - fetch the branch and checkout after cloning

     .. code-block:: bash

         git fetch
         git checkout develop

Build The Doc
-------------

The repo should have several scripts to build the doc. The most important of
which is `containthedocs-build.sh`

#. From the currenlty open terminal move into the cloned repo directory

   .. code-block:: bash

      cd f5-agility-labs-template

#. Build your html from rst

   .. code-block:: bash

      ./containthedocs-build.sh

#. You now should have a new directory with your lab html files

   .. code-block:: bash

      ls -la docs/_build

   You should see the following output

   .. code-block:: bash

      ❯ ls -la docs/_build
      total 16
      drwxr-xr-x 4 root  root  4096 Feb 22 13:14 .
      drwxr-xr-x 6 vince vince 4096 Feb 22 13:14 ..
      drwxr-xr-x 3 root  root  4096 Feb 22 13:14 doctrees
      drwxr-xr-x 6 root  root  4096 Feb 22 13:14 html

View your doc
-------------

Recap
-----
You now have a working repo with 