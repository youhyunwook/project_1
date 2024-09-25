<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스크롤 애니메이션</title>
    <style type="text/css">
        body {
            margin: 0;
            overflow: hidden; /* 기본 스크롤 숨기기 */
        }

        .section {
            height: 100vh; /* 각 섹션의 높이를 뷰포트 높이에 맞춤 */
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2rem;
            color: white;
        }

        #section1 { background-color: #3498db; }
        #section2 { background-color: #e74c3c; }
        #section3 { background-color: #2ecc71; }
        #section4 { background-color: #f39c12; }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let currentSection = 0;
            const sections = document.querySelectorAll('.section');
            let isScrolling = false; // 스크롤 애니메이션 상태 변수 추가

            function scrollToSection(index) {
                if (index < 0 || index >= sections.length) return;
                currentSection = index;
                isScrolling = true; // 스크롤 시작
                sections[currentSection].scrollIntoView({
                    behavior: 'smooth'
                });
                setTimeout(() => {
                    isScrolling = false; // 스크롤 끝
                }, 1000); // 애니메이션 시간과 일치하도록 조정
            }

            window.addEventListener('wheel', (event) => {
                event.preventDefault(); // 기본 스크롤 방지
                if (!isScrolling) { // 현재 스크롤 중이 아닐 때만 실행
                    if (event.deltaY > 0) {
                        scrollToSection(currentSection + 1); // 아래로 스크롤
                    } else {
                        scrollToSection(currentSection - 1); // 위로 스크롤
                    }
                }
            });
        });
    </script>
</head>
<body>
    <div class="section" id="section1">1번째 섹션</div>
    <div class="section" id="section2">2번째 섹션</div>
    <div class="section" id="section3">3번째 섹션</div>
    <div class="section" id="section4">4번째 섹션</div>
</body>
</html>
