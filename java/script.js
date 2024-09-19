function showTab(tabName) {
	    const tabs = document.querySelectorAll('.tab-content');
	    tabs.forEach(tab => {
	        tab.style.display = tab.id === tabName ? 'block' : 'none';
	    });
	
	    const buttons = document.querySelectorAll('.tab-button');
	    buttons.forEach(button => {
	        if (button.textContent.trim() === tabName) {
	            button.classList.add('active');
	        } else {
	            button.classList.remove('active');
	        }
	    });
	}
	
	// 페이지 로드 시 기본 탭을 설정
	document.addEventListener('DOMContentLoaded', () => {
	    showTab('guest'); // 기본 '손님' 탭을 표시
	});