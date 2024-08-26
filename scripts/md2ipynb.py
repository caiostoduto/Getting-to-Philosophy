import json
import sys
from os import path


with open(
    path.join(path.dirname(path.abspath(__file__)), "./template.json"), "r"
) as template_file:
    template = json.load(template_file)

with open(sys.argv[1], "r") as md_file:
    template["cells"][0]["source"] = md_file.readlines()

with open(sys.argv[2], "w") as ipynb_file:
    json.dump(template, ipynb_file, indent=2)
