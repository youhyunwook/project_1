// 업로드시 csv 파일만 선택 그리고 1GB 이하의 파일만 등록가능 
document.getElementById('uploadForm').addEventListener('submit', function(event) {
    const fileInput = document.getElementById('fileUpload');
    const file = fileInput.files[0];
    const errorElement = document.getElementById('fileError');
    // Clear previous error messages
    errorElement.textContent = '';

    if (file) {
        const fileSize = file.size / (1024 * 1024 * 1024); // file size 1GB
        const fileType = file.name.split('.').pop().toLowerCase();

        // Check file size (1GB max)
        if (fileSize > 1) {
            errorElement.textContent = '파일 용량은 1GB이하로 만 가능합니다 그 이상일 경우에는 문의 게시판을 이용해주세요';
            event.preventDefault();
            return;
        }
        // Check file extension (CSV only)
        if (fileType !== 'csv') {
            errorElement.textContent = '파일은 csv 파일만 업로드가 가능합니다';
            event.preventDefault();
            return;
        }
    } else {
        errorElement.textContent = '파일을선택하지 않았습니다.';
        event.preventDefault();
    }
});

