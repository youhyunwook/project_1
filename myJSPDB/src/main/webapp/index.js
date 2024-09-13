// 네비게이션 상태를 저장하고 로드하는 함수들
function saveNavState(isOpen) {
  localStorage.setItem('navOpen', isOpen);
}

function loadNavState() {
  return localStorage.getItem('navOpen') === 'true';
}

// 페이지 로드 시 실행
document.addEventListener('DOMContentLoaded', function() {
  var navbarToggler = document.querySelector('.navbar-toggler');
  var navbarCollapse = document.querySelector('#navbarToggleExternalContent');

  // 저장된 상태 확인 및 적용
  if (loadNavState()) {
    navbarCollapse.classList.add('show');
  }

  // 토글 버튼 클릭 이벤트
  navbarToggler.addEventListener('click', function() {
    var isOpen = navbarCollapse.classList.toggle('show');
    saveNavState(isOpen);
  });

  // 네비게이션 링크 클릭 이벤트
  var navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(function(link) {
    link.addEventListener('click', function() {
      saveNavState(navbarCollapse.classList.contains('show'));
    });
  });
});/**
 * 
 */