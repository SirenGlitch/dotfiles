# type: reportUndefinedVariable=false

config = config
c = c

# Colour stuff
import yaml

with (config.configdir / "colors.yml").open() as f:
    yaml_data = yaml.safe_load(f)


def dict_attrs(obj, path=""):
    if isinstance(obj, dict):
        for k, v in obj.items():
            yield from dict_attrs(v, "{}.{}".format(path, k) if path else k)
    else:
        yield path, obj


for k, v in dict_attrs(yaml_data):
    config.set(k, v)

# Aliases
c.aliases["cs"] = "config-source"

# Bindings
config.bind(",m", "spawn umpv {url}")
config.bind(",M", "hint links spawn umpv {hint-url}")
config.bind(";M", "hint --rapid links spawn umpv {hint-url}")

# spellchecking
c.spellcheck.languages = ["en-GB"]

c.tabs.title.format = "{audio}{current_title}"
c.tabs.show = "multiple"
c.fonts.web.size.default = 16

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com?q={}",
    "!aw": "https://wiki.archlinux.org/?search={}",
    "!apkg": "https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "!ghs": "https://github.com/search?o=desc&q={}&s=stars",
    "!gh": "https://github.com/{}",
    "!yt": "https://www.youtube.com/results?search_query={}",
}

c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "history",
    "filesystem",
]

config.set(
    "content.javascript.clipboard", "access", "*://*.archwiki.org/"
)  # enable clipboard access to the archwiki
config.set("scrolling.smooth", True)  # enable smooth scrolling

config.load_autoconfig()

# c.auto_save.session = True  # save tabs on quit/restart

# dark mode setup
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "never"
config.set("colors.webpage.darkmode.enabled", False, "file://*")
config.set("colors.webpage.darkmode.enabled", False, "*.sparx-learning.com/*")

# styles, cosmetics
c.tabs.padding = {"top": 5, "bottom": 5, "left": 9, "right": 9}
c.tabs.indicator.width = 0  # no tab indicators
c.tabs.width = "7%"

# fonts
c.fonts.default_family = ["JetBrainsMono Nerd Font"]
c.fonts.default_size = "10pt"
c.fonts.web.family.fixed = "monospace"
c.fonts.web.family.sans_serif = "monospace"
c.fonts.web.family.serif = "monospace"
config.set("fonts.web.family.serif", "JetBrainsMono Nerd Font", "qute://*")
c.fonts.web.family.standard = "monospace"

# privacy stuff
# config.set("content.private_browsing", True)
# config.set("content.webgl", False)
config.set("content.geolocation", False)
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)

# editor stuff
config.set(
    "editor.command",
    ["kitty", "-e", "nvim", "{file}", "-c", "normal {line}G{column0}l"],
)

# Adblocking stuff

c.content.blocking.enabled = True
c.content.blocking.method = "adblock"
c.content.blocking.adblock.lists = [
    "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
]
