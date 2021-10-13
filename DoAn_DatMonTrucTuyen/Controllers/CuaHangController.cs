using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn_DatMonTrucTuyen.Models;
using System.IO;
namespace DoAn_DatMonTrucTuyen.Controllers
{
    public class CuaHangController : Controller
    {
        //
        // GET: /CuaHang/
        DataClasses1DataContext data = new DataClasses1DataContext();
        public ActionResult ThongTinCH(string makh)
        {
            CuaHang CH = data.CuaHangs.FirstOrDefault(t => t.MaKH == makh);
            return View(CH);
        }
        public ActionResult DSCuaHang(string makh)
        {
            List<CuaHang> lstch = (List<CuaHang>)Session["ch"];
            return View(lstch);
        }
        public ActionResult ThongTinCH_ma(string mach)
        {
            CuaHang CH = data.CuaHangs.FirstOrDefault(t => t.MaCH==mach);
            return View("ThongTinCH",CH);
        }
        [HttpPost]
        public ActionResult ThongTinCH_Sua(CuaHang ch, FormCollection a, HttpPostedFileBase fup)
        {
            ch = data.CuaHangs.FirstOrDefault(c => c.MaCH == a["txtMa"]);
            ch.TenCH = a["txtTen"];
            ch.DiaChi = a["txtDiaChi"];
            ch.Sdt = a["txtSDT"];
            string tenHinh = ch.HinhAnh;
            if (fup != null)
            {
                string duoi = fup.FileName.Substring(fup.FileName.Length - 4);
                string hinh = ch.MaCH + duoi;
                var path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
                if (System.IO.File.Exists(path))
                {
                    int i = 0;
                    do
                    {
                        hinh = ch.MaCH + i + duoi;
                        i++;
                        path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
                    } while (System.IO.File.Exists(path));
                    fup.SaveAs(path);
                    ch.HinhAnh = hinh;

                }
                else
                {
                    fup.SaveAs(path);
                    ch.HinhAnh = hinh;
                }
            }
            else
            {
                ch.HinhAnh = tenHinh;
            }
            try
            {
                UpdateModel(ch);
                data.SubmitChanges();
                ViewBag.tb = true;
                return View("ThongTinCH", ch);
            }
            catch 
            {
                ViewBag.tb = false;
                return View("ThongTinCH", ch);
            };
            
        }
        public ActionResult DanhMucCH()
        {
            KhachHang kh = Session["kh"] as KhachHang;
            List<CuaHang> lst = data.CuaHangs.Where(c=>c.MaKH==kh.MaKH).ToList();
            return PartialView(lst);
        }
        public ActionResult ThucDon(string mach)
        {
            List<SanPham> lstsp = data.SanPhams.Where(sp => sp.MaCH == mach).ToList();
            List<LoaiSP> loai = data.LoaiSPs.ToList();
            ViewData["Loai"] = loai;
            return View(lstsp);
        }
        //public JsonResult LayMaSanPham(string ID)
        //{
        //    SanPham s = data.SanPhams.SingleOrDefault(t => t.MaSP == ID);
        //    return Json(s, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult ThemMon(string ma, SanPham sp, HttpPostedFileBase HinhAnh, FormCollection a)
        {
            int spcuoi = data.SanPhams.Count();
            SanPham s = data.SanPhams.Skip(spcuoi - 1).FirstOrDefault();
            string masp = s.MaSP;
            int stt = int.Parse(masp.Remove(0, 2));
            if (stt + 1 < 10)
                masp = "SP00" + (stt + 1);
            else
                if (stt + 1 < 100)
                    masp = "SP0" + (stt + 1);
                else
                    masp = "SP" + (stt + 1);
            sp.MaSP = masp;
            sp.TenSP = a["TenSP"];
            sp.MoTa = a["MoTa"];
            sp.DonGia = int.Parse(a["Gia"]);
            sp.TinhTrang = a["tinhtrang"];
            string duoi = HinhAnh.FileName.Substring(HinhAnh.FileName.Length - 4);
            string hinh = masp + duoi;
            var path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
            if (System.IO.File.Exists(path))
            {
                int i = 0;
                do
                {
                    hinh = masp + i + duoi;
                    i++;
                    path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
                } while (System.IO.File.Exists(path));
                HinhAnh.SaveAs(path);
                sp.HinhAnh = hinh;

            }
            else
            {
                HinhAnh.SaveAs(path);
                sp.HinhAnh = hinh;
            }
            sp.MaCH = ma;
            sp.MaLoai = a["Loai"];
            try
            {
                data.SanPhams.InsertOnSubmit(sp);
                data.SubmitChanges();
                List<SanPham> lstsp = data.SanPhams.Where(t => t.MaCH == sp.MaCH).ToList();
                List<LoaiSP> loai = data.LoaiSPs.ToList();
                ViewData["Loai"] = loai;
                return View("ThucDon", lstsp);
            }
            catch { return RedirectToAction("TrangChu", "Home"); };
        }
        public ActionResult Chitiet(string masp)
        {
            SanPham sp = data.SanPhams.FirstOrDefault(s => s.MaSP == masp);
            return View(sp);
        }
        public ActionResult Xoa(string masp)
        {
            SanPham sp = data.SanPhams.FirstOrDefault(s => s.MaSP == masp);
            try
            {
                
                data.SanPhams.DeleteOnSubmit(sp);
                data.SubmitChanges();
                return RedirectToAction("ThucDon", new { mach = sp.MaCH });
            }
            catch
            {
                return RedirectToAction("ThucDon", new { mach = sp.MaCH });
            }
        }
        [HttpPost]
        public ActionResult Sua(string ma, SanPham sp, HttpPostedFileBase Hinh, FormCollection a)
        {
            sp = data.SanPhams.FirstOrDefault(s => s.MaSP == a["txtMa"]);
            sp.TenSP = a["TenSP"];
            sp.MoTa = a["MoTa"];
            sp.DonGia = int.Parse(a["Gia"]);
            sp.TinhTrang = a["tinhtrang"];
            string tenhinh = sp.HinhAnh;
            string masp = sp.MaSP;
            if (Hinh != null)
            {
                string duoi = Hinh.FileName.Substring(Hinh.FileName.Length - 4);
                string hinh = masp + duoi;
                var path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
                if (System.IO.File.Exists(path))
                {
                    int i = 0;
                    do
                    {
                        hinh = masp + i + duoi;
                        i++;
                        path = Path.Combine(Server.MapPath("~/Content/HinhAnh"), hinh);
                    } while (System.IO.File.Exists(path));
                    Hinh.SaveAs(path);
                    sp.HinhAnh = hinh;

                }
                else
                {
                    Hinh.SaveAs(path);
                    sp.HinhAnh = hinh;
                }
            }
            else
            {
                sp.HinhAnh = tenhinh;
            }
            sp.MaCH = ma;
            sp.MaLoai = a["Loai"];
            try
            {
                UpdateModel(sp);
                data.SubmitChanges();
                return RedirectToAction("ThucDon", new { mach = sp.MaCH });
            }
            catch { return View("Chitiet", sp); };
            
        }
        

    }
}
