﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using webcoso.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;

namespace webcoso.Controllers
{
    public class SanPhamsController : Controller
    {
        // GET: SanPhams
        private WebcosoContext db = new WebcosoContext();
        private ApplicationDbContext data = new ApplicationDbContext();

        // GET: SanPhams
        public ActionResult Index(int? page, string searchString)
        {
            ViewBag.Keyword = searchString;
            var loaiSP = db.LoaiSP.ToList();
            int pageSize = 15;
            int pageNum = page ?? 1;
            SanPhamViewModel sp = new SanPhamViewModel
            {
                LoaiSPs = loaiSP,
                SanPhams = (PagedList<SanPham>)SanPham.getAll(searchString).ToPagedList(pageNum, pageSize)
            };
            return View(sp);
        }

        public ActionResult Index1(int? page, string searchString)
        {
            var loaiSP = db.LoaiSP.ToList();
            int pageSize = 15;
            int pageNum = page ?? 1;

            SanPhamViewModel sp = new SanPhamViewModel
            {
                LoaiSPs = loaiSP,
                SanPhams = (PagedList<SanPham>)SanPham.getAllgiaduoi2().ToPagedList(pageNum, pageSize)
            };
            if (searchString != null && searchString != "")
            {
                return RedirectToAction("Index", new { @searchString = searchString });
            }
            return View(sp);
        }

        public ActionResult Index2(int? page, string searchString)
        {
            var loaiSP = db.LoaiSP.ToList();
            int pageSize = 15;
            int pageNum = page ?? 1;

            SanPhamViewModel sp = new SanPhamViewModel
            {
                LoaiSPs = loaiSP,
                SanPhams = (PagedList<SanPham>)SanPham.getAllgia23().ToPagedList(pageNum, pageSize)
            };
            if (searchString != null && searchString != "")
            {
                return RedirectToAction("Index", new { @searchString = searchString });
            }
            return View(sp);
        }

        public ActionResult Index3(int? page, string searchString)
        {
            var loaiSP = db.LoaiSP.ToList();
            int pageSize = 15;
            int pageNum = page ?? 1;

            SanPhamViewModel sp = new SanPhamViewModel
            {
                LoaiSPs = loaiSP,
                SanPhams = (PagedList<SanPham>)SanPham.getAllgiatren3().ToPagedList(pageNum, pageSize)
            };
            if (searchString != null && searchString != "")
            {
                return RedirectToAction("Index", new { @searchString = searchString });
            }
            return View(sp);
        }

        // GET: SanPhams Admin

        public ActionResult IndexAdmin(int? page, string searchString)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            ViewBag.Keyword = searchString;
            //var all_sanPham = db.SanPham.ToList();
            int pageSize = 5;
            int pageNum = page ?? 1;
            return View(SanPham.getAll(searchString).ToPagedList(pageNum, pageSize));
        }

        // GET: SanPhams/Details/5
        public ActionResult Details(int? id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPham.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            foreach (var i in sanPham.BinhLuan)
            {
                ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(i.MaKH);
                i.Name = user.Name;
            }
            ApplicationUser userLogin = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());
            if (userLogin != null)
            {
                if (db.DanhGia.Where(p => p.MaKH == userLogin.Id && p.MaSP == id).Count() > 0)
                {
                    ViewBag.ttDanhGia = 1;
                }
                else
                {
                    ViewBag.ttDanhGia = 0;
                }
            }
            if (db.DanhGia.Where(p => p.MaSP == id).Count() != 0)
            {
                float star = (float)db.DanhGia.Where(p => p.MaSP == id).Sum(p => p.SoSao) / (float)db.DanhGia.Where(p => p.MaSP == id).Count();
                float motSao = (float)db.DanhGia.Where(p => p.SoSao == 1 && p.MaSP == id).Count() / (float)db.DanhGia.Where(p => p.MaSP == id).Count();
                float haiSao = (float)db.DanhGia.Where(p => p.SoSao == 2 && p.MaSP == id).Count() / (float)db.DanhGia.Where(p => p.MaSP == id).Count();
                float baSao = (float)db.DanhGia.Where(p => p.SoSao == 3 && p.MaSP == id).Count() / (float)db.DanhGia.Where(p => p.MaSP == id).Count();
                float bonSao = (float)db.DanhGia.Where(p => p.SoSao == 4 && p.MaSP == id).Count() / (float)db.DanhGia.Where(p => p.MaSP == id).Count();
                float namSao = (float)db.DanhGia.Where(p => p.SoSao == 5 && p.MaSP == id).Count() / (float)db.DanhGia.Where(p => p.MaSP == id).Count();
                ViewBag.updateStar = star.ToString("0.#");
                ViewBag.motSao = motSao * 100;
                ViewBag.haiSao = haiSao * 100;
                ViewBag.baSao = baSao * 100;
                ViewBag.bonSao = bonSao * 100;
                ViewBag.namSao = namSao * 100;
            }
            else
            {
                ViewBag.updateStar = 0;
                ViewBag.motSao = 0;
                ViewBag.haiSao = 0;
                ViewBag.baSao = 0;
                ViewBag.bonSao = 0;
                ViewBag.namSao = 0;
            }


            int pageSize = 5;
            int pageNum = page ?? 1;
            SanPhamDetailModel sp = new SanPhamDetailModel
            {
                SanPham = sanPham,
                BinhLuans = (PagedList<BinhLuan>)sanPham.BinhLuan.OrderByDescending(p => p.NgayTao).ToPagedList(pageNum, pageSize)
            };
            return View(sp);
        }
        public ActionResult sanphamtheomaloai(int? page, int? maloai, string searchString)
        {
            var loaiSP = db.LoaiSP.ToList();
            int pageSize = 15;
            int pageNum = page ?? 1;
            int maloaii = maloai ?? 8;
            SanPhamViewModel sp = new SanPhamViewModel
            {
                LoaiSPs = loaiSP,
                SanPhams = (PagedList<SanPham>)SanPham.getsanphamtheoid(maloaii).ToPagedList(pageNum, pageSize)
            };
            if (searchString != null && searchString != "")
            {
                return RedirectToAction("Index", new { @searchString = searchString });
            }
            return View(sp);
        }

        // GET: SanPhams/Details/5 Admin
        public ActionResult DetailsAdmin(int? id)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPham.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Details(int id)
        {
            BinhLuansController addbinhluan = new BinhLuansController();
            BinhLuan binhLuan = new BinhLuan();
            if (Request["txtContent"] != null)
            {
                string content = Request["txtContent"].ToString() + " ";
                if (content == " ")
                {
                    return RedirectToAction("Details");
                }
                addbinhluan.Create(content, id, binhLuan);
            }


            DanhGiasController addDanhGia = new DanhGiasController();
            DanhGia danhGia = new DanhGia();
            if (Request["star"] != null)
            {
                String soSao = Request["star"].ToString() + " ";
                if (soSao == " ")
                {
                    return RedirectToAction("Details");
                }
                int SoSao = Int32.Parse(soSao);
                addDanhGia.Create(SoSao, id, danhGia);
            }




            return RedirectToAction("Details");
        }



        // GET: SanPhams/Create
        public ActionResult Create()
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            ViewBag.MaLoai = new SelectList(db.LoaiSP, "MaLoai", "TenLoai");
            ViewBag.MaTH = new SelectList(db.ThuongHieu, "MaTH", "TenTH");
            ViewBag.MaNhom = new SelectList(db.NhomSanPham, "MaNhom", "TenNhom");
            return View();
        }

        // POST: SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSP,MaLoai,MaTH,MaNhom,Ten,MoTa,Gia,SoLuong,DonVi,GiamGia,Hinh")] SanPham sanPham)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (ModelState.IsValid)
            {
                db.SanPham.Add(sanPham);
                db.SaveChanges();
                TempData["AlertMessage"] = "Thêm thành công!";
                return RedirectToAction("Create");
            }

            ViewBag.MaLoai = new SelectList(db.LoaiSP, "MaLoai", "TenLoai", sanPham.MaLoai);
            ViewBag.MaTH = new SelectList(db.ThuongHieu, "MaTH", "TenTH", sanPham.ThuongHieu);
            ViewBag.MaNhom = new SelectList(db.NhomSanPham, "MaNhom", "TenNhom", sanPham.NhomSanPham);
            return View(sanPham);
        }

        // GET: SanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPham.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoai = new SelectList(db.LoaiSP, "MaLoai", "TenLoai", sanPham.MaLoai);
            ViewBag.MaTH = new SelectList(db.ThuongHieu, "MaTH", "TenTH", sanPham.ThuongHieu);
            ViewBag.MaNhom = new SelectList(db.NhomSanPham, "MaNhom", "TenNhom", sanPham.NhomSanPham);

            return View(sanPham);
        }

        // POST: SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,MaLoai,MaTH,MaNhom,Ten,MoTa,Gia,SoLuong,DonVi,GiamGia,Hinh")] SanPham sanPham)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                TempData["AlertMessage"] = "Chỉnh sửa thành công!";
                return RedirectToAction("IndexAdmin");
            }
            ViewBag.MaLoai = new SelectList(db.LoaiSP, "MaLoai", "TenLoai", sanPham.MaLoai);
            ViewBag.MaTH = new SelectList(db.ThuongHieu, "MaTH", "TenTH", sanPham.ThuongHieu);
            ViewBag.MaNhom = new SelectList(db.NhomSanPham, "MaNhom", "TenNhom", sanPham.NhomSanPham);
            return View(sanPham);
        }

        // GET: SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPham.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            SanPham sanPham = db.SanPham.Find(id);
            db.SanPham.Remove(sanPham);
            db.SaveChanges();
            TempData["AlertMessage"] = "Xoá thành công!";
            return RedirectToAction("IndexAdmin");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public string ProcessUpload(HttpPostedFileBase file)
        {
            if (file == null)
            {
                return "";
            }
            file.SaveAs(Server.MapPath("~/Content/images/" + file.FileName));
            return "/Content/images/" + file.FileName;
        }

        public bool AuthAdmin()
        {
            var user = data.Users.FirstOrDefault(u => u.UserName == User.Identity.Name);
            if (user == null)
                return false;
            var userExist = user.Roles.FirstOrDefault(r => r.UserId == user.Id);
            if (userExist == null)
                return false;
            if (userExist.RoleId != "1")
                return false;
            return true;
        }
    }
}