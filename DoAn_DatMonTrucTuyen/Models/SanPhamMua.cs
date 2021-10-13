using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_DatMonTrucTuyen.Models
{
    public class SanPhamMua
    {
        public string sMaCH { get; set; }
        public string sMaSanPham { get; set; }
        public string sTenSP { get; set; }
        public string sHinhAnh { get; set; }
        public int dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public int ThanhTien 
        {
            get { return iSoLuong * dDonGia; }
        
        }
        DataClasses1DataContext data = new DataClasses1DataContext();
        //method
        //phuong thuc khoi tao
        public SanPhamMua(string ms)
        {
            SanPham sp = data.SanPhams.SingleOrDefault(t => t.MaSP == ms);
            if (sp != null)
            {
                sMaCH = sp.MaCH;
                sMaSanPham = ms;
                sTenSP = sp.TenSP;
                sHinhAnh = sp.HinhAnh;
                dDonGia = (int)sp.DonGia;
                iSoLuong = 1;
            }
        }
    }
}