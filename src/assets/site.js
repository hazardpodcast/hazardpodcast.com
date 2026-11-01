document.addEventListener('DOMContentLoaded', function() {
  addTrademarksToHazard();
});

function addTrademarksToHazard() {
  // Create a walker to traverse all text nodes
  const walker = document.createTreeWalker(
    document.body,
    NodeFilter.SHOW_TEXT,
    null,
    false
  );

  const nodesToReplace = [];
  let node;

  // Collect nodes to replace (can't modify while walking)
  while (node = walker.nextNode()) {
    if (node.textContent.includes('Hazard')) {
      nodesToReplace.push(node);
    }
  }

  // Replace text nodes with versions that include the superscript TM
  nodesToReplace.forEach(node => {
    // Use a word-boundary regex to match "Hazard" as a whole word
    const regex = /\bHazard\b/g;

    if (regex.test(node.textContent)) {
      const fragment = document.createDocumentFragment();
      let lastIndex = 0;
      const text = node.textContent;

      // Reset regex to iterate
      const matches = [...text.matchAll(/\bHazard\b/g)];

      matches.forEach(match => {
        // Add text before the match
        if (match.index > lastIndex) {
          fragment.appendChild(
            document.createTextNode(text.substring(lastIndex, match.index))
          );
        }

        // Add "Hazard" with superscript TM
        const span = document.createElement('span');
        span.textContent = 'Hazard';
        fragment.appendChild(span);

        const sup = document.createElement('div');
        sup.textContent = '™';
		sup.className = 'trademark-added';
        fragment.appendChild(sup);

        lastIndex = match.index + match[0].length;
      });

      // Add remaining text
      if (lastIndex < text.length) {
        fragment.appendChild(
          document.createTextNode(text.substring(lastIndex))
        );
      }

      // Replace the original node
      node.parentNode.replaceChild(fragment, node);
    }
  });
}
