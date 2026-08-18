"""Generate labelled QR codes for the EasyRetro board of each room.

Reads rooms.json ({"SE1": "https://...", ...}) and writes one PNG per room
into the current directory: qr-se1.png, qr-se2.png, ...
"""

import json
from pathlib import Path

import qrcode
from PIL import Image, ImageDraw, ImageFont

HERE = Path(__file__).parent
ROOMS_FILE = HERE / "rooms.json"

QR_BOX_SIZE = 14           # px per QR module
QR_BORDER = 2              # quiet zone, in modules
PADDING = 48               # px around the whole card
LABEL_GAP = 28             # px between QR and room label
CAPTION_GAP = 10           # px between room label and caption
LABEL_SIZE = 92
CAPTION_SIZE = 34

BG = "#FFFFFF"
INK = "#101418"
MUTED = "#6B7280"

FONT_CANDIDATES = (
    "/System/Library/Fonts/Supplemental/Helvetica.ttc",
    "/System/Library/Fonts/Helvetica.ttc",
    "/System/Library/Fonts/SFNS.ttf",
)


def load_font(size: int, bold: bool) -> ImageFont.FreeTypeFont:
    index = 1 if bold else 0
    for path in FONT_CANDIDATES:
        if Path(path).exists():
            try:
                return ImageFont.truetype(path, size, index=index)
            except OSError:
                continue
    return ImageFont.load_default(size)


def text_size(draw: ImageDraw.ImageDraw, text: str, font) -> tuple[int, int]:
    left, top, right, bottom = draw.textbbox((0, 0), text, font=font)
    return right - left, bottom - top


def build_card(room: str, url: str, caption: str) -> Image.Image:
    qr = qrcode.QRCode(
        error_correction=qrcode.constants.ERROR_CORRECT_Q,
        box_size=QR_BOX_SIZE,
        border=QR_BORDER,
    )
    qr.add_data(url)
    qr.make(fit=True)
    qr_img = qr.make_image(fill_color=INK, back_color=BG).convert("RGB")

    label_font = load_font(LABEL_SIZE, bold=True)
    caption_font = load_font(CAPTION_SIZE, bold=False)

    probe = ImageDraw.Draw(Image.new("RGB", (1, 1)))
    label_w, label_h = text_size(probe, room, label_font)
    caption_w, caption_h = text_size(probe, caption, caption_font)

    width = max(qr_img.width, label_w, caption_w) + PADDING * 2
    height = (
        PADDING
        + qr_img.height
        + LABEL_GAP
        + label_h
        + CAPTION_GAP
        + caption_h
        + PADDING
    )

    card = Image.new("RGB", (width, height), BG)
    draw = ImageDraw.Draw(card)

    y = PADDING
    card.paste(qr_img, ((width - qr_img.width) // 2, y))
    y += qr_img.height + LABEL_GAP

    draw.text((width // 2, y), room, font=label_font, fill=INK, anchor="ma")
    y += label_h + CAPTION_GAP

    draw.text((width // 2, y), caption, font=caption_font, fill=MUTED, anchor="ma")

    return card


def main() -> None:
    rooms = json.loads(ROOMS_FILE.read_text())
    caption = rooms.pop("_caption", "EasyRetro")

    for room, url in rooms.items():
        out = HERE / f"qr-{room.lower().replace(' ', '-')}.png"
        build_card(room, url, caption).save(out, optimize=True)
        print(f"{out.name}  <-  {url}")


if __name__ == "__main__":
    main()
