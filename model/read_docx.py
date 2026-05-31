import zipfile
import xml.etree.ElementTree as ET
import sys

docx_path = r'C:\Users\Rumeysa\Downloads\MoodTune_PRD_v2.docx'
out_path = r'C:\Users\Rumeysa\MoodTune\MoodTune_PRD_v2.txt'

try:
    namespaces = {'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'}
    text = []
    with zipfile.ZipFile(docx_path) as docx:
        tree = ET.fromstring(docx.read('word/document.xml'))
        for paragraph in tree.findall('.//w:p', namespaces):
            texts = [node.text for node in paragraph.findall('.//w:t', namespaces) if node.text]
            if texts:
                text.append(''.join(texts))
    
    with open(out_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(text))
    print("Success")
except Exception as e:
    print(f"Error: {e}")
