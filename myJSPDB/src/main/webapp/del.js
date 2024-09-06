$(document).ready(function() {
    // 삭제 버튼 클릭 시 삭제 확인 및 처리
    $(document).on('click', '#delete-button', function(e) {
        e.preventDefault(); // 기본 폼 제출 동작 방지
        var confirmDelete = confirm("정말 삭제하시겠습니까?");
        if (confirmDelete) {
            var requestNumber = $(this).data("request-number");
            window.location.href = "deletePost.jsp?request_number=" + requestNumber;
        }
    });
});
