using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn_DatMonTrucTuyen.Models;
namespace DoAn_DatMonTrucTuyen.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        DataClasses1DataContext data = new DataClasses1DataContext();
        public ActionResult TrangChu()
        {

            List<SanPham> lst = data.SanPhams.ToList<SanPham>();
            List<CuaHang>lstch = data.CuaHangs.ToList<CuaHang>();
            string td = "Trang Chủ";
            ViewBag.td = td;
            ViewData["CuaHang"] = lstch;
            return View(lst);
        }
        public ActionResult ChiTiet(string ma)
        {
            SanPham sp = data.SanPhams.SingleOrDefault(s => s.MaSP == ma);
            CuaHang ch = data.CuaHangs.SingleOrDefault(c => c.MaCH == sp.MaCH);
            List<SanPham> lst = data.SanPhams.Where(t => t.MaCH == sp.MaCH).ToList<SanPham>();
            List<LoaiSP> lstl = data.LoaiSPs.ToList();
            ViewData["LoaiSP"] = lstl;
            ViewBag.lst = lst;
            ViewBag.c = ch as CuaHang ;
            return View(sp);
        } 
        public ActionResult DanhMuc()
        {
            List<LoaiSP> lst = data.LoaiSPs.ToList();
            return PartialView(lst);
        }
        public ActionResult khoitao()
        {
            GioHang gh = Session["gh"] as GioHang;
            KhachHang kh = Session["kh"] as KhachHang;
            List<CuaHang> ch = Session["ch"] as List<CuaHang>;
            ViewBag.kh = kh;
            return PartialView(gh);
        }
        public ActionResult HTTheoLoaiSP(string ml)
        {
            LoaiSP a = data.LoaiSPs.SingleOrDefault(l => l.MaLoai == ml);
            List<SanPham> ls = data.SanPhams.Where(t => t.MaLoai == ml).ToList<SanPham>();
            List<CuaHang> lstch = data.CuaHangs.ToList<CuaHang>();
            string td = a.TenLoai;
            ViewBag.td = td;
            ViewData["CuaHang"] = lstch;
            return View("TrangChu", ls);
        }
        [HttpPost]
        public ActionResult KetQuaTimKiem(FormCollection a)
        {
            string tk = a["txtTK"];
            List<SanPham> lstsp = data.SanPhams.Where(sp => sp.TenSP.ToLower().Contains(tk)).ToList();
            List<CuaHang> lstch = data.CuaHangs.ToList<CuaHang>();
            string td = "Kết quả tìm kiếm của:" + tk;
            ViewBag.td = td;
            ViewData["CuaHang"] = lstch;
            return View(lstsp);
        }
    }
}
