import sys
import os
import json


def generate_html():
    for file in os.listdir(comic_folder_path):
        if os.path.isfile(os.path.join(comic_folder_path, file)) and any(file.lower().endswith(ext) for ext in image_extensions):
            image_files.append(file)

    # Sort numerically based on digits in the filename, fallback to alphabetical
    try:
        image_files.sort(key=lambda x: int(''''''.join(filter(str.isdigit, os.path.splitext(x)[0])) or 0))
    except ValueError:
        print("Could not sort numerically, falling back to alphabetical sort.")
        image_files.sort()

    js_image_files = json.dumps(image_files)

    html_content = f'''
<!DOCTYPE html>
<html>
<head>
<title>Image Gallery</title>
<meta charset="UTF-8">
<style>
    body {{ font-family: sans-serif; margin: 0; background-color: #2d2d2d; color: #f1f1f1; }}
    .controls {{
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        background: #3c3c3c;
        padding: 10px 20px;
        border-bottom: 1px solid #4f4f4f;
        z-index: 1000;
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        align-items: center;
        box-sizing: border-box;
    }}
    .controls > div {{ display: flex; align-items: center; gap: 10px; }}
    .image-container {{
        margin-top: 80px; /* Space for the fixed controls */
        text-align: center;
        padding: 10px;
    }}
    .gallery-image {{
        display: block;
        margin: 15px auto;
        max-width: 100%; /* Ensure image is not wider than its container */
        border: 2px solid #4f4f4f;
        border-radius: 4px;
        background-color: #3c3c3c;
    }}
    .nav-button, input[type="number"], label {{
        padding: 8px 12px;
        background-color: #4f4f4f;
        color: #f1f1f1;
        border: 1px solid #666;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }}
    label {{
        border: none;
        background: none;
        padding: 0;
    }}
    .nav-button:disabled {{
        background-color: #2d2d2d;
        cursor: not-allowed;
        color: #777;
    }}
    input[type="number"] {{ width: 60px; }}
    input[type="range"] {{ cursor: pointer; vertical-align: middle; }}
    #page-info {{ font-weight: bold; }}
</style>
</head>
<body>

<div class="controls">
    <div>
        <label for="size-slider">Size:</label>
        <input type="range" id="size-slider" min="20" max="100" value="80" step="1">
        <span id="size-value">80%</span>
    </div>
    <div>
        <label for="per-page">Per Page:</label>
        <input type="number" id="per-page" value="50" min="1">
    </div>
    <div>
        <button id="prev-btn" class="nav-button">&larr; Prev</button>
        <span id="page-info">Page 1 / 1</span>
        <button id="next-btn" class="nav-button">Next &rarr;</button>
    </div>
</div>

<div id="image-container" class="image-container"></div>

<script>
    const imageFiles = {js_image_files};

    const imageContainer = document.getElementById('image-container');
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');
    const pageInfo = document.getElementById('page-info');
    const perPageInput = document.getElementById('per-page');
    const sizeSlider = document.getElementById('size-slider');
    const sizeValue = document.getElementById('size-value');

    let currentPage = 1;
    let imagesPerPage = parseInt(perPageInput.value, 10);
    let imageWidth = parseInt(sizeSlider.value, 10);

    function render() {{
        if (!imageFiles || imageFiles.length === 0) {{
            imageContainer.innerHTML = "<p>No images found in this directory.</p>";
            document.querySelector('.controls').style.display = 'none';
            return;
        }}

        imagesPerPage = parseInt(perPageInput.value, 10) || 1;
        const totalPages = Math.ceil(imageFiles.length / imagesPerPage);
        
        if (currentPage > totalPages) {{
            currentPage = totalPages || 1;
        }}

        imageContainer.innerHTML = '';

        const startIndex = (currentPage - 1) * imagesPerPage;
        const endIndex = startIndex + imagesPerPage;
        const pageImages = imageFiles.slice(startIndex, endIndex);

        const fragment = document.createDocumentFragment();
        pageImages.forEach(fileName => {{
            const img = document.createElement('img');
            img.src = fileName;
            img.alt = fileName;
            img.className = 'gallery-image';
            img.style.width = `${{imageWidth}}%`;
            fragment.appendChild(img);
        }});
        imageContainer.appendChild(fragment);

        pageInfo.textContent = `Page ${{currentPage}} / ${{totalPages}}`;
        prevBtn.disabled = currentPage === 1;
        nextBtn.disabled = currentPage === totalPages;
        sizeValue.textContent = `${{imageWidth}}%`;
        window.scrollTo(0, 0);
    }}

    function updateImageSizes() {{
        imageWidth = parseInt(sizeSlider.value, 10);
        sizeValue.textContent = `${{imageWidth}}%`;
        const imagesOnPage = imageContainer.getElementsByClassName('gallery-image');
        for (let img of imagesOnPage) {{
            img.style.width = `${{imageWidth}}%`;
        }}
    }}

    function setupEventListeners() {{
        prevBtn.addEventListener('click', () => {{
            if (currentPage > 1) {{
                currentPage--;
                render();
            }}
        }});

        nextBtn.addEventListener('click', () => {{
            const totalPages = Math.ceil(imageFiles.length / imagesPerPage);
            if (currentPage < totalPages) {{
                currentPage++;
                render();
            }}
        }});

        perPageInput.addEventListener('change', () => {{
            const newPerPage = parseInt(perPageInput.value, 10);
            if (newPerPage > 0) {{
                const firstImageIndex = (currentPage - 1) * imagesPerPage;
                imagesPerPage = newPerPage;
                currentPage = Math.floor(firstImageIndex / imagesPerPage) + 1;
                render();
            }}
        }});

        sizeSlider.addEventListener('input', updateImageSizes);

        document.addEventListener('keydown', (e) => {{
            if (document.activeElement.tagName.toLowerCase() === 'input') return;
            if (e.key === 'ArrowLeft' || e.key.toLowerCase() === 'a') {{
                prevBtn.click();
            }} else if (e.key === 'ArrowRight' || e.key.toLowerCase() === 'd') {{
                nextBtn.click();
            }}
        }});
    }}

    render();
    setupEventListeners();
</script>
</body>
</html>
'''

    # 將 HTML 內容寫入檔案
    html_file_path = os.path.join(comic_folder_path, "images_gallery.html")
    with open(html_file_path, "w", encoding="utf-8") as f:
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