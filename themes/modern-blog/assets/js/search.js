// Search functionality
(function() {
  const searchInput = document.getElementById('search-input');
  const searchResults = document.getElementById('search-results');
  let searchIndex = [];
  
  // Load search index
  if (window.searchIndexData) {
    searchIndex = window.searchIndexData;
  }
  
  if (!searchInput || !searchResults) return;
  
  function performSearch(query) {
    if (!query.trim()) {
      searchResults.innerHTML = '';
      return;
    }
    
    const queryLower = query.toLowerCase();
    const results = searchIndex
      .filter(item => {
        const titleMatch = item.title.toLowerCase().includes(queryLower);
        const contentMatch = item.content.toLowerCase().includes(queryLower);
        return titleMatch || contentMatch;
      })
      .slice(0, 10);
    
    displayResults(results, query);
  }
  
  function displayResults(results, query) {
    if (results.length === 0) {
      searchResults.innerHTML = '<div class="search-result-item"><p>未找到相关文章</p></div>';
      return;
    }
    
    const html = results.map(item => {
      const excerpt = getExcerpt(item.content, query, 150);
      return `
        <div class="search-result-item" onclick="window.location.href='${item.url}'">
          <div class="search-result-title">${highlightText(item.title, query)}</div>
          <div class="search-result-excerpt">${excerpt}</div>
        </div>
      `;
    }).join('');
    
    searchResults.innerHTML = html;
  }
  
  function getExcerpt(text, query, maxLength) {
    const queryLower = query.toLowerCase();
    const textLower = text.toLowerCase();
    const index = textLower.indexOf(queryLower);
    
    if (index === -1) {
      return text.substring(0, maxLength) + '...';
    }
    
    const start = Math.max(0, index - 50);
    const end = Math.min(text.length, index + query.length + maxLength - 50);
    let excerpt = text.substring(start, end);
    
    if (start > 0) excerpt = '...' + excerpt;
    if (end < text.length) excerpt = excerpt + '...';
    
    return highlightText(excerpt, query);
  }
  
  function highlightText(text, query) {
    if (!query) return text;
    const regex = new RegExp(`(${query})`, 'gi');
    return text.replace(regex, '<mark>$1</mark>');
  }
  
  // Debounce search
  let searchTimeout;
  searchInput.addEventListener('input', (e) => {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(() => {
      performSearch(e.target.value);
    }, 300);
  });
})();

