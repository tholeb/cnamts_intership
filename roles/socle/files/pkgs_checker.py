# Get packages versions without pip

import pkg_resources
import sys
installed_packages = {d.project_name: d.version for d in pkg_resources.working_set}

# Get args number
args = len(sys.argv)

# No args
if args == 1:
    # List all packages
    print ("All packages:")
    print(installed_packages)
else:
    # List a specific package (passed in args via CLI)
    for i in range (1, args):
        pkg = sys.argv[i]

        if pkg in installed_packages:
            print(pkg, installed_packages[pkg])
        else:
            print(pkg, "is not installed")