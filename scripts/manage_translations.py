#!/usr/bin/env python
#
# NOTE: This script is based on tuesmon-back manage_translations.py script
#       (https://github.com/tuesmoncom/tuesmon-back/blob/master/scripts/manage_translations.py)
#
# This python file contains utility scripts to manage tuesmon translations.
# It has to be run inside the tuesmon-front git root directory (over the tuesmon-back env).
#
# The following commands are available:
#
# * fetch: fetch translations from transifex.com
#
# * commit: update resources in transifex.com with the local files
#
# Each command support the --languages and --resources options to limit their
# operation to the specified language or resource. For example, to get stats
# for Spanish in contrib.admin, run:
#
#  $ python scripts/manage_translations.py fetch --language=es --resources=locale


import os
from argparse import ArgumentParser
from argparse import RawTextHelpFormatter

from subprocess import PIPE, Popen, call


def _tx_resource_for_name(name):
    """ Return the Transifex resource name """
    return "tuesmon-contrib-subscriptions.{}".format(name)


def fetch(resources=None, languages=None):
    """
    Fetch translations from Transifex.
    """
    if not resources:
        if languages is None:
            call("tx pull -f", shell=True)
        else:
            for lang in languages:
                call("tx pull -f -l {lang}".format(lang=lang), shell=True)

    else:
        for resource in resources:
            if languages is None:
                call("tx pull -r {res} -f ".format(res=_tx_resource_for_name(resource)),
                     shell=True)
            else:
                for lang in languages:
                    call("tx pull -r {res} -f -l {lang}".format(res=_tx_resource_for_name(resource), lang=lang),
                         shell=True)


def commit(resources=None, languages=None):
    """
    Commit messages to Transifex,
    """
    if not resources:
        if languages is None:
            call("tx push -s -l en", shell=True)
        else:
            for lang in languages:
                call("tx push -t -l {lang}".format(lang=lang), shell=True)
    else:
        for resource in resources:
            # Transifex push
            if languages is None:
                call("tx push -r {res} -s -l en".format(res=_tx_resource_for_name(resource)), shell=True)
            else:
                for lang in languages:
                    call("tx push -r {res} -t -l {lang}".format(res= _tx_resource_for_name(resource), lang=lang), shell=True)


if __name__ == "__main__":
    try:
        devnull = open(os.devnull)
        Popen(["tx"], stdout=devnull, stderr=devnull).communicate()
    except OSError as e:
        if e.errno == os.errno.ENOENT:
            print("""
You need transifex-client, install it.

 1. Install transifex-client, use

       $ pip install --upgrade transifex-client==0.12.2

 2. Create ~/.transifexrc file:

       $ vim ~/.transifexrc"

       [https://www.transifex.com]
       hostname = https://www.transifex.com
       token =
       username = <YOUR_USERNAME>
       password = <YOUR_PASSWOR>
                  """)
            exit(1)

    RUNABLE_SCRIPTS = {
        "commit": "send .json file to transifex ('en' by default).",
        "fetch": "get .json files from transifex.",
    }

    parser = ArgumentParser(description="manage translations in tuesmon-contrib-subscriptions between the repo and transifex.",
                            formatter_class=RawTextHelpFormatter)
    parser.add_argument("cmd", nargs=1,
        help="\n".join(["{0} - {1}".format(c, h) for c, h in RUNABLE_SCRIPTS.items()]))
    parser.add_argument("-r", "--resources", action="append",
        help="limit operation to the specified resources")
    parser.add_argument("-l", "--languages", action="append",
        help="limit operation to the specified languages")
    options = parser.parse_args()

    if options.cmd[0] in RUNABLE_SCRIPTS.keys():
        eval(options.cmd[0])(options.resources, options.languages)
    else:
        print("Available commands are: {}".format(", ".join(RUNABLE_SCRIPTS.keys())))
