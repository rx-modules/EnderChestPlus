from typing import Iterable
from beet import Context, ItemModifier, LootTable, Function
from nbtlib.tag import List, Compound, String, Byte
from nbtlib import serialize_tag
import yaml
from colour import Color
import math
import json
from itertools import cycle, count, chain
from pprint import pprint


LOOT_TABLE = {
  "type": "minecraft:generic",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:written_book",
          "functions": [
            {
              "function": "minecraft:set_nbt",
              "tag": "{...}"
            }
          ]
        }
      ]
    }
  ]
}

def gradient(ctx, title):
    color1, color2 = Color(ctx.meta["colors"][0]), Color(ctx.meta["colors"][1])

    first_half = color1.range_to(color2, math.floor(len(title) / 2))
    second_half = color2.range_to(color1, math.ceil(len(title) / 2))
    pretty = [
        {"text": letter, "color": color.hex_l, "italic": False}
        for letter, color in zip(title, chain(first_half, second_half))
    ]

    return pretty


def table_of_contents(ctx: Context, titles: list[str]):
    content = [
        "",
        gradient(ctx, ctx.project_name), {"text": " (tm)", "color": "dark_gray", "italic": True}, "\n",
        {"text": "The storage solution for the modern age", "color":"#845f86", "italic": False}, "\n\n",
        {"text": "-------------------", "color": "dark_gray"}, "\n\n"
    ]

    colors = cycle(("#845f86", "dark_gray"))
    for title, color, page_no in zip(titles, colors, count(2)):
        content.append(
            {
                "text": f"> {title}\n", 
                "color": color,
                "clickEvent": {
                    "action": "change_page",
                    "value": page_no
                },
                "hoverEvent": {
                    "action": "show_text",
                    "contents": f"Click to navigate to {title}"
                }
            }
        )

    content[-1]["italic"] = True
    content.append("\n")
    content.append("-------------------")

    return content

def page_content(ctx: Context, text: dict[str, str]):
    return [
        "",
        {
            "text": "< ",
            "color": "#845f86",
            "clickEvent": {
                "action": "change_page",
                "value": 1
            },
            "hoverEvent": {
                "action": "show_text",
                "contents": "Click to navigate to the Table of Contents"
            },
            "extra": [
               *gradient(ctx, text['title'])
            ]
        },
        "\n\n",
        {
            "text": text['body'],
            "color": "#33104a",
            "italic": True if text['title'] == 'Legal' else False
        }
    ]


def beet_default(ctx: Context):
    manual = yaml.safe_load((ctx.directory / "resources" / "manual.yaml").read_text())

    color1, color2 = ctx.meta["colors"][0], ctx.meta["colors"][1]

    root = Compound()
    root["display"] = Compound()
    root["author"] = String(manual["author"])
    root["title"] = String()

    root["display"]["Name"] = String(json.dumps(gradient(
        ctx, manual["title"]
    )))

    lore = [
        {"text": line, "color": "dark_gray", "italic": False} for line in manual["lore"]
    ]
    root["display"]["Lore"] = String(json.dumps(lore))

    root["pages"] = List[String]()
    root["resolved"] = Byte(True)
    
    # table of contents
    content = table_of_contents(ctx, [page["title"] for page in manual["pages"]])
    root["pages"].append(String(json.dumps(content)))

    for page in manual["pages"]:
        root["pages"].append(String(json.dumps(page_content(ctx, page)).replace("\\n", "\n")))

    st = serialize_tag(root)

    LOOT_TABLE['pools'][0]['entries'][0]['functions'][0]['tag'] = st
    ctx.data['rx.ec:manual'] = LootTable(LOOT_TABLE)
    ctx.data['rx.ec:manual'] = ItemModifier({"function": "minecraft:set_nbt", "tag": st})
