$(document).ready(function () {
});
function open_Add() {
    $('#btn_Add').show();
    //$('#btn_Update').hide();
}
function getID(mID) {
    $.ajax(
        {
            url: "/CuaHang/LayMaSanPham/" + mID,
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                //$('#id').val(result.MaSP);
                //$('.TenSP').val(result.TenSP);
                //$('.MoTa').val(result.MoTa);
                //$('.Loai').val(result.MaLoai);
                //$('.Gia').val(result.DonGia);
                //$('.tinhtrang').val(result.TinhTrang);
                $('#btn_Them').trigger('click');
                $('#btn_Add').hide();
                $('#btn_Update').show();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }

        });
}