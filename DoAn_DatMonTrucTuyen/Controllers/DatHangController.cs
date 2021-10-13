using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn_DatMonTrucTuyen.Models;
namespace DoAn_DatMonTrucTuyen.Controllers
{
    public class DatHangController : Controller
    {
        //
        // GET: /DatHang/
        DataClasses1DataContext data = new DataClasses1DataContext();
        public ActionResult ThemGioHang(string ma)
        {
            GioHang gh = (GioHang)Session["gh"];
            if (gh == null)
            {
                gh = new GioHang();
            }
            gh.Them(ma);
            Session["gh"] = gh;
            return RedirectToAction("ChiTiet", "Home", new { ma = ma});
        }
        public ActionResult Thaydoi(string ma,int dk)
        {
            GioHang gh = (GioHang)Session["gh"];
            if (gh == null)
            {
                gh = new GioHang();
            }
            if (dk == 1)
            {
                gh.Them(ma);
            }
            else
                gh.Bo(ma);
            Session["gh"] = gh;
            return RedirectToAction("XemGioHang", "DatHang", new { ma = ma });
        }
        public ActionResult XemGioHang()
        {
            GioHang gio = (GioHang)Session["gh"];
            return PartialView(gio);
        }
        public ActionResult XemGioHangPhu()
        {
            GioHang gio = (GioHang)Session["gh"];
            return PartialView(gio);
        }
        [HttpGet]
        public ActionResult ThanhToan()
        {
            GioHang gio = (GioHang)Session["gh"];
            KhachHang kh = (KhachHang)Session["kh"];
            if (kh == null)
                return RedirectToAction("DangNhap", "KhachHang");
            else
            {
                ViewBag.k = kh;
                return View(gio);
            }
        }
        [HttpPost]
        public ActionResult LuuDonHang(FormCollection g)
        {
            KhachHang khach = Session["kh"] as KhachHang;
            GioHang gio = Session["gh"] as GioHang;
            try
            {
                string ngaygiao = g["txtDate"];
                HoaDon hd = new HoaDon();
                hd.MaCH = gio.lstSP[0].sMaCH;
                hd.NgayDat = DateTime.Now;
                hd.NgayGiao = DateTime.Parse(ngaygiao);
                hd.TongTien = gio.TongThanhTien();
                hd.MaKH = khach.MaKH;
                data.HoaDons.InsertOnSubmit(hd);
                data.SubmitChanges();

                foreach (SanPhamMua item in gio.lstSP)
                {
                    ChiTietHD ct = new ChiTietHD();
                    ct.MaHD = hd.MaHD;
                    ct.MaSP = item.sMaSanPham;
                    ct.Soluong = item.iSoLuong;
                    ct.Giaban = item.dDonGia;
                    ct.ThanhTien = item.ThanhTien;
                    data.ChiTietHDs.InsertOnSubmit(ct);
                    data.SubmitChanges();
                }
                Session["gh"] = null;
                ViewBag.tb = true;
                return View("XemGioHang",gio);
            }
            catch
            {
                ViewBag.tb = false;
                return View("XemGioHang", gio);
            }
            
        }
    }
}
