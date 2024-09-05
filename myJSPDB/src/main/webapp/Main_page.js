document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        const fileInput = document.getElementById('fileUpload');
        const file = fileInput.files[0];
        const errorElement = document.getElementById('fileError');

        // 이전 오류 메시지 지우기
        errorElement.textContent = '';

        if (file) {
            const fileSizeMB = file.size / (1024 * 1024); // 파일 크기(MB 단위)
            const fileType = file.name.split('.').pop().toLowerCase();

            // 파일 크기 500MB 이하인지 확인
            if (fileSizeMB > 500) {
                errorElement.textContent = '파일 용량은 500MB 미만으로만 가능합니다. 그 이상일 경우에는 문의 게시판을 이용해주세요.';
                event.preventDefault(); 
                return;
            }

            // 파일 타입이 csv인지 확인
            if (fileType !== 'csv') {
                errorElement.textContent = '파일은 CSV 파일만 업로드가 가능합니다.';
                event.preventDefault(); 
                return;
            }
        } else {
            errorElement.textContent = '파일을 선택하지 않았습니다.';
            event.preventDefault(); 
        }
    });
});
