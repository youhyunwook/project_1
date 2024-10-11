document.addEventListener('DOMContentLoaded', function() {
    // 폼 제출 이벤트 리스너
    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        const fileInput = document.getElementById('fileUpload');
        const file = fileInput.files[0];
        const errorElement = document.getElementById('fileError');
        // 이전 오류 메시지 제거
        errorElement.textContent = '';

        if (file) {
            const fileSize = file.size / (1024 * 1024 * 1024); // 파일 크기 (GB 단위)
            const fileType = file.name.split('.').pop().toLowerCase();

            // 파일 크기 확인 (1GB 이하)
            if (fileSize > 1) {
                errorElement.textContent = '파일 용량은 1GB 이하로 만 가능합니다. 그 이상일 경우에는 문의 게시판을 이용해주세요.';
                event.preventDefault(); // 폼 제출 중지
                return;
            }
            // 파일 확장자 확인 (CSV만 허용)
            if (fileType !== 'csv') {
                errorElement.textContent = '파일은 CSV 파일만 업로드가 가능합니다.';
                event.preventDefault(); // 폼 제출 중지
                return;
            }
        } else {
            errorElement.textContent = '파일을 선택하지 않았습니다.';
            event.preventDefault(); // 폼 제출 중지
        }

        // 폼 제출 전에 로딩 바 표시
        document.getElementById('loading').style.display = 'flex';
    });
});
