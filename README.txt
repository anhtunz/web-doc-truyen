Ai làm xong phần nào nhớ commit lại và nhắn vào nhóm nhé
- Ngày 12/05/2023
Bạn sửa lại cái table truyện rồi nhé, cái anh_truyen không để image nữa mà để varchar để dán đường link vào
Cập nhật thêm 1 số câu lệnh Script mới
 - Ngày 15/05/2023 (Tuấn làm)
  + Thêm danh sách truyện
  + Tìm kiếm truyện
 - Ngày 16/06/2023 (Tuấn làm) 
  Trong file add_truyen_moi.sql bạn có add thêm mấy truyện nữa rồi nhé
 - Ngày 17/5/23 
 + Việt xóa file bên ngoài web-doc-truyen và tạo 1 file mới trong ATuan để connect lại dữ liệu
- Ngày 20/5/2023
 + Tuấn làm thêm giao diện add truyện, add chương, profile của tác giả
 + Cập nhật thêm thuộc tính duyet trong database nhưng k add vào, vào design xong add thêm cột là được.
- Ngày 21/05/2023
 + Cập nhật lại toàn bộ id trong database để thuộc tính tự tăng, thuộc tính DATE thành DATETIME trong table binh_luan sẽ tự import ngày giờ hiện tại khi comment

- Ngày 26/05/2023: 
+ Tuấn làm được thêm và sửa truyện đã lket vs base
+ Mọi người đổi lại base trong thuộc tính tinh_trang chỗ nào Chưa Full đổi thành NotFull nhé
+ Hoàn thành phần thêm sửa xóa truyện

- Ngày 30/5: 
 + Tuấn thêm cột thoi gian vào 2 chương trong table truyện và chương truyện, cái này cập nhật tự động và không cần nhập thời gian
    Code: ALTER TABLE truyen ADD truyen_thoi_gian DATETIME DEFAULT GETDATE();
          ALTER TABLE chuong ADD chuong_thoi_gian DATETIME DEFAULT GETDATE();
 + Bổ sung tay thêm 1 thể loại nữa là Truyện ma, cái này mn vào hẳn table thêm cho nhanh
 + Cập nhật thêm truyện và chương của truyện đó ở 2 thể loại là tiểu thuyết và truyện ma, code chi tiết ở trong file SQL_SCript, copy chạy là xong.
 
- Ngày 1/6/2023: 
 + Tuấn hoàn thành phần thêm sửa xóa truyện có gắn id_nguoi_dung
 
- Ngày 5/6/2023
 + Tuấn làm thêm cái lưu web nhưng chưa link vào được
 
- Ngày 7/6/2023
 + Tuấn làm thêm chức năng đăng kí, làm lại giao diện login và phân quyền cho đăng truyện
- Ngày 10/06/2023
 + Tuấn làm thêm phân quyền cho quản lí truyện, nếu là admin sẽ hiển thị ra toàn bộ truyện, người dùng thì sẽ hiển thị truyện của người đó, user sẽ không xem được
