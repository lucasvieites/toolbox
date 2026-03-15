# extract_svg_text.py

import xml.etree.ElementTree as ET

def extract_text_from_svg(svg_content):
    """
    Extracts text from SVG content.

    :param svg_content: str, raw SVG content as a string
    :return: list of text elements found in the SVG
    """
    root = ET.fromstring(svg_content)
    text_elements = []
    for text in root.iter('{http://www.w3.org/2000/svg}text'):
        text_elements.append(text.text)
    return text_elements

# Example usage:
# svg_content = '<svg><text>Hello, World!</text></svg>'
# print(extract_text_from_svg(svg_content))
