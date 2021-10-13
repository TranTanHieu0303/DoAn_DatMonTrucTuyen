using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_DatMonTrucTuyen.Models
{
    public class GioHang
    {
        public List<SanPhamMua> lstSP;
        //pt khoi tao
        public GioHang()
        {
            lstSP = new List<SanPhamMua>();
        }
        public GioHang(List<SanPhamMua> ds)
        {
            lstSP = ds;
        }
        //pt tinh toan
        public int Somathang()
        {
            if (lstSP == null)
                return 0;
            return lstSP.Count();
        }
        public int TongSL()
        {
            if (lstSP == null)
                return 0;
            return lstSP.Sum(t => t.iSoLuong);
        }
        public int TongThanhTien()
        {
            if (lstSP == null)
                return 0;
            return lstSP.Sum(t => t.ThanhTien);
        }
        //pt xu ly
        public int Them(string ms)
        {
            SanPhamMua sp = lstSP.SingleOrDefault(g => g.sMaSanPham == ms);
            if (sp == null)
            {
                SanPhamMua a = new SanPhamMua(ms);
                if (a == null)
                    return 0;
                if (lstSP.Count != 0)
                {
                    if (a.sMaCH != lstSP[0].sMaCH)
                        lstSP = new List<SanPhamMua>();
                }
                lstSP.Add(a);
            }
            else
            {
                sp.iSoLuong += 1;
            }
            return 1;
        }
        public int Bo(string ms)
        {
            SanPhamMua sp = lstSP.SingleOrDefault(g => g.sMaSanPham == ms);
                sp.iSoLuong -= 1;
                if (sp.iSoLuong == 0)
                    lstSP.Remove(sp);
            return 1;
        }
    }
}