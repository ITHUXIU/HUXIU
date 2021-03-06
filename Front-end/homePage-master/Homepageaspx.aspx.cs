﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_homePage_master_Homepageaspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                //绑定分类
                var newclass = from it in db.News_class select it;
                rptClass.DataSource = newclass.ToList();
                rptClass.DataBind();

                //绑定头条
                var top = from it in db.Top select it;
                rptTop.DataSource = top.ToList();
                rptTop.DataBind();

                //绑定资讯头条
                var topNews = from it in db.News where it.news_top == 1 select it;
                rptNewstop.DataSource = topNews.ToList();
                rptNewstop.DataBind();

                //绑定资讯5条
                var News = from it in db.News where it.news_top ==0 orderby it.news_time descending select it;
                PagedDataSource pds = new PagedDataSource();
                pds.AllowPaging = true;
                pds.PageSize = 5;
                pds.DataSource = News.ToList();
                lbTotal.Text = pds.PageCount.ToString();
                pds.CurrentPageIndex = 0;
                rptNews.DataSource = pds;
                rptNews.DataBind();

                //绑定热文
                var HotNews = from it in db.News orderby it.news_hot descending select it;
                pds.AllowPaging = true;
                pds.PageSize = 3;
                pds.DataSource = HotNews.ToList();
                pds.CurrentPageIndex = 0;
                rptHotNews.DataSource = pds;
                rptHotNews.DataBind();
            }
        }
    }
    //绑定资讯头两条
    protected void rptNewstop_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbTopNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;

        }
    }
    //绑定剩下五条的内容
    protected void rptNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;

            label = (Label)e.Item.FindControl("lbNewsclass");

            int class_id = Convert.ToInt32(label.Text);

            using (var db = new HuXiuEntities())
            {
                News_class newsclass = db.News_class.SingleOrDefault(a => a.news_classid == class_id);
                label.Text = newsclass.news_classname;
            }
        }
    }

    void DataBindToRepeater(int currentPage)
    {
        using (var db = new HuXiuEntities())
        {
            var News = from it in db.News where it.news_top==0 orderby it.news_time descending select it;
            //news.ToList();

            News.ToList();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 12;

            pds.DataSource = News.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;

            rptNews.DataSource = pds;

            rptNews.DataBind();
        }

    }

    //换一换
    protected void lbtChange_Click(object sender, EventArgs e)
    {
        if (lbTotal.Text != lbNow.Text)
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) + 1);
            DataBindToRepeater(Convert.ToInt32(lbNow.Text));
        }
        else
        {
            lbNow.Text = Convert.ToString(1);
            DataBindToRepeater(Convert.ToInt32(lbNow.Text));
        }
    }

    //绑定热文
    int itemcount = 1;
    protected void rptHotNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbHotNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;


            Image image1 = (Image)e.Item.FindControl("imgUp");

            Image image2 = (Image)e.Item.FindControl("imgDown");

            label = (Label)e.Item.FindControl("lbItem");

            

            if(itemcount%2==0)
            {
                image1.Visible = false;
                image2.Visible = true;
            }
            else
            {
                image1.Visible = true;
                image2.Visible = false;
            }
            itemcount++;
            //label.Text = itemcount.ToString();

        }
    }
}