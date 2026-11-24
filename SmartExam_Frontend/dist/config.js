// Hỗ trợ chế độ demo độc lập trên trình duyệt hoặc kết nối Backend API qua tham số ?mode=api
const urlParams = typeof window !== 'undefined' ? new URLSearchParams(window.location.search) : null;
const pageHost = typeof window !== 'undefined' ? window.location.hostname : '127.0.0.1';
const apiHost = !pageHost || pageHost === 'localhost' ? '127.0.0.1' : pageHost;
const selectedMode = urlParams?.get('mode') || 'demo';
window.SMARTEXAM_CONFIG = { mode: selectedMode, baseUrl: `http://${apiHost}:8000` };
