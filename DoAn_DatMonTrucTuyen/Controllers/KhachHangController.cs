using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn_DatMonTrucTuyen.Models;
using System.IO;
namespace DoAn_DatMonTrucTuyen.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/
        DataClasses1DataContext data = new DataClasses1DataContext();
        [HttpGet]
        public ActionResult DangNhap()
        {
            KhachHang kh = null;
            Session["kh"] = kh;
            List<CuaHang> lstch = new List<CuaHang>();
            Session["ch"] = lstch;
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection k)
        {
            string ten = k["txtTen"];
            string mk = k["txtMK"];
            KhachHang kh = data.KhachHangs.SingleOrDefault(t => t.Usename == ten && t.Pass == mk);
            if (kh != null)
            {
                List<CuaHang> lst = data.CuaHangs.Where(c => c.MaKH == kh.MaKH).ToList();
                Session["kh"] = kh;
                Session["ch"] = lst;
                GioHang gio = (GioHang)Session["gh"];
                if(gio==null)
                    return RedirectToAction("TrangChu", "Home");
                else
                    return RedirectToAction("XemGioHang", "DatHang");
            }
            else
            {
                
                ViewBag.tb = false;
                return View();
            }
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(KhachHang khach,FormCollection a, HttpPostedFileBase HinhAnh)
        {
            int khcuoi = data.KhachHangs.Count();
            KhachHang kh = data.KhachHangs.Skip(khcuoi - 1).FirstOrDefault();
            string makh = kh.MaKH;
            int stt = int.Parse(makh.Remove(0, 2));
            if (stt + 1 < 10)
                makh = "KH00" + (stt + 1);
            else
                if (stt + 1 < 100)
                    makh = "KH0" + (stt + 1);
                else
                    makh = "KH" + (stt + 1);
            khach.MaKH = makh;
            khach.Usename = a["txtTen"];
            khach.Pass = a["txtMK"];
            khach.HoTen = a["txtHoTen"];
            var rdGt = a["rdGioiTinh"];
            string gioitinh;
            if (rdGt.ToString() == "1")
            {
                gioitinh = "Nam";
            }
            else
            {
                gioitinh = "Nữ";
            }
            khach.GioiTinh = gioitinh;
            khach.DiaChi = a["txtDiaChi"];
            khach.Sdt = a["txtSDT"];
            string duoi = HinhAnh.FileName.Substring(HinhAnh.FileName.Length - 4);
            string hinh = makh + duoi;
            var path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
            if (System.IO.File.Exists(path))
            {
                int i = 0;
                do
                {
                    hinh = makh + i + duoi;
                    i++;
                    path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
                } while (System.IO.File.Exists(path));
                HinhAnh.SaveAs(path);
                khach.HinhAnh = hinh;
                
            }
            else
            {
                HinhAnh.SaveAs(path);
                khach.HinhAnh = hinh;    
            }
            try
            {
                data.KhachHangs.InsertOnSubmit(khach);
                data.SubmitChanges();
                ViewBag.tb = true;
                return View("DangNhap");
            }
            catch 
            {
                return View(); 
            };
        }
        [HttpGet]
        public ActionResult ThongTinTaiKhoan(string makh)
        {
            KhachHang kh = data.KhachHangs.SingleOrDefault(t => t.MaKH == makh);
            return View(kh);
        }
        [HttpPost]
        public ActionResult ThongTinTaiKhoan(KhachHang khach, FormCollection a, HttpPostedFileBase fup)
        {
            khach = data.KhachHangs.SingleOrDefault(t => t.MaKH == a["txtMa"]);
            khach.Usename = a["txtTen"];
            khach.Pass = a["txtMK"];
            khach.HoTen = a["txtHoTen"];
            string tenHinh = khach.HinhAnh;
            var rdGt = a["rdGioiTinh"];
            string gioitinh;
            if (rdGt.ToString() == "1")
            {
                gioitinh = "Nam";
            }
            else
            {
                gioitinh = "Nữ";
            }
            khach.GioiTinh = gioitinh;
            khach.DiaChi = a["txtDiaChi"];
            khach.Sdt = a["txtSDT"];
            if (fup != null)
            {
                string duoi = fup.FileName.Substring(fup.FileName.Length - 4);
                string hinh = khach.MaKH + duoi;
                var path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
                if (System.IO.File.Exists(path))
                {
                    int i = 0;
                    do
                    {
                        hinh = khach.MaKH + i + duoi;
                        i++;
                        path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
                    } while (System.IO.File.Exists(path));
                    fup.SaveAs(path);
                    khach.HinhAnh = hinh;

                }
                else
                {
                    fup.SaveAs(path);
                    khach.HinhAnh = hinh;
                }
            }
            else
            {
                khach.HinhAnh = tenHinh ;
            }
            try
            {
                UpdateModel(khach);
                data.SubmitChanges();
                ViewBag.tb = true;
                Session["kh"] = khach;
                return View(khach);
            }
            catch
            {
                ViewBag.tb = false;
                return View();
            };
        }
    }

}
