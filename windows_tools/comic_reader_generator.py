import sys
import os


def generate_html():
    for file in os.listdir(comic_folder_path):
        if os.path.isfile(os.path.join(comic_folder_path, file)) and any(file.lower().endswith(ext) for ext in image_extensions):
            image_files.append(file)

    image_files.sort(key=lambda x: int(''.join(filter(str.isdigit, x))))

    html_content = """
    <html>
    <head>
    <style>
        .centered-image {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
            max-width: 1000px;
        }
    </style>
    </head>
    <body>
    """
    for image in image_files:
        html_content += f'<img src="{image}" alt="{image}" class="centered-image" ><br>\n'
    html_content += "</body></html>"

    # 將 HTML 內容寫入檔案
    html_file_path = os.path.join(comic_folder_path, "images_gallery.html")
    with open(html_file_path, "w") as f:
        f.write(html_content)

    print("HTML file generated successfully.")


if __name__ == "__main__":
    if len(sys.argv) > 2:
        print("一次只能輸入一個路徑 Too many arguments")
        raise

    image_extensions = ['.jpg', '.jpeg', '.png',
                        '.gif', '.bmp', '.tiff', '.webp']

    while True:
        image_files = []
        if len(sys.argv) == 2:
            comic_folder_path = sys.argv[1]
        else:
            comic_folder_path = input("請輸入路徑：")

        if not (os.path.exists(comic_folder_path)):
            print("路徑不存在 Path not exists")
            continue

        generate_html()
        if len(sys.argv) == 2:
            break
