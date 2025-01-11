from bs4 import BeautifulSoup
import re

def clean_math(math_str):
    """Convert math notation to LLM-friendly format"""
    # Remove LaTeX-style annotations
    math_str = re.sub(r'\\(text|mathcal|math[a-z]*){([^}]*)}', r'\2', math_str)
    
    # Handle subscripts/superscripts
    math_str = re.sub(r'_\{([^}]*)\}', r'_\1', math_str)
    math_str = re.sub(r'\^\{([^}]*)\}', r'^\1', math_str)
    
    # Simplify common math symbols
    replacements = {
        '\\sum': 'sum',
        '\\prod': 'product', 
        '\\int': 'integral',
        '\\infty': 'infinity',
        '\\rightarrow': '->',
        '\\leftarrow': '<-',
        '\\alpha': 'alpha',
        '\\beta': 'beta',
        '\\gamma': 'gamma',
        '\\theta': 'theta',
        '\\lambda': 'lambda'
    }
    for tex, plain in replacements.items():
        math_str = math_str.replace(tex, plain)
        
    return math_str.strip()

def extract_text(html_path):
    """Extract clean text from arXiv HTML"""
    with open(html_path, 'r', encoding='utf-8') as f:
        soup = BeautifulSoup(f.read(), 'html.parser')

    # Remove scripts, styles, and navigation
    for tag in soup(['script', 'style', 'nav']):
        tag.decompose()
        
    # Extract text while preserving math
    text = []
    
    # Get title
    title = soup.find('title')
    if title:
        text.append(f"Title: {title.text.strip()}\n")
    
    # Get abstract
    abstract = soup.find('div', class_='ltx_abstract')
    if abstract:
        text.append("Abstract:")
        text.append(abstract.get_text().strip())
        text.append("")
        
    # Process main content
    for section in soup.find_all(['section', 'div'], class_='ltx_section'):
        # Get section heading
        heading = section.find(['h1', 'h2', 'h3', 'h4'])
        if heading:
            text.append(f"\n{heading.get_text().strip()}\n")
            
        # Process paragraphs
        for p in section.find_all('p', class_='ltx_p'):
            para_text = []
            
            # Handle both text and math elements
            for element in p.children:
                if element.name == 'math':
                    math_content = element.get_text().strip()
                    para_text.append(f" {clean_math(math_content)} ")
                elif element.string:
                    para_text.append(element.string.strip())
                    
            text.append(''.join(para_text).strip())
            text.append("")
            
    return '\n'.join(text)

def main():
    input_path = 'blt.html'
    output_path = 'blt.txt'
    
    text = extract_text(input_path)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(text)
        
if __name__ == '__main__':
    main()
