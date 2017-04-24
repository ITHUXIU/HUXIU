using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Web;

/// <summary>
/// Class1 的摘要说明
/// </summary>
public class Class1
{
    public Class1()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public string md5(string str, int code)  //code 16 或 32  用于哈希加密
    {
        if (code == 16) //16位MD5加密（取32位加密的9~25字符）  
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToLower().Substring(8, 16);
        }

        if (code == 32) //32位加密  
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToLower();
        }

        return "00000000000000000000000000000000";
    }
    //将IEnumerable<T>类型的集合转换为DataTable类型 
    public DataTable LINQToDataTable<T>(IEnumerable<T> varlist)
    {   //定义要返回的DataTable对象
        DataTable dtReturn = new DataTable();
        // 保存列集合的属性信息数组
        PropertyInfo[] oProps = null;
        if (varlist == null) return dtReturn;//安全性检查
        //循环遍历集合，使用反射获取类型的属性信息
        foreach (T rec in varlist)
        {
            //使用反射获取T类型的属性信息，返回一个PropertyInfo类型的集合
            if (oProps == null)
            {
                oProps = ((Type)rec.GetType()).GetProperties();
                //循环PropertyInfo数组
                foreach (PropertyInfo pi in oProps)
                {
                    Type colType = pi.PropertyType;//得到属性的类型
                    //如果属性为泛型类型
                    if ((colType.IsGenericType) && (colType.GetGenericTypeDefinition()
                    == typeof(Nullable<>)))
                    {   //获取泛型类型的参数
                        colType = colType.GetGenericArguments()[0];
                    }
                    //将类型的属性名称与属性类型作为DataTable的列数据
                    dtReturn.Columns.Add(new DataColumn(pi.Name, colType));
                }
            }
            //新建一个用于添加到DataTable中的DataRow对象
            DataRow dr = dtReturn.NewRow();
            //循环遍历属性集合
            foreach (PropertyInfo pi in oProps)
            {   //为DataRow中的指定列赋值
                dr[pi.Name] = pi.GetValue(rec, null) == null ?
                    DBNull.Value : pi.GetValue(rec, null);
            }
            //将具有结果值的DataRow添加到DataTable集合中
            dtReturn.Rows.Add(dr);
        }
        return dtReturn;//返回DataTable对象

    }
    public string GetRandomColor()
    {
        Random RandomNum_First = new Random((int)DateTime.Now.Ticks);
        // 对于C#的随机数，没什么好说的 
        System.Threading.Thread.Sleep(RandomNum_First.Next(50));
        Random RandomNum_Sencond = new Random((int)DateTime.Now.Ticks);

        // 为了在白色背景上显示，尽量生成深色 
        int int_Red = RandomNum_First.Next(256);
        int int_Green = RandomNum_Sencond.Next(256);
        int int_Blue = (int_Red + int_Green > 400) ? 0 : 400 - int_Red - int_Green;
        int_Blue = (int_Blue > 255) ? 255 : int_Blue;

        return Color.FromArgb(int_Red, int_Green, int_Blue).Name;
    }
    //显示多久之前时间
    public string PassTime(DateTime time)
    {
        if (Convert.ToInt32(DateTime.Now.Year - time.Year) == 0)
        {
            if (Convert.ToInt32(DateTime.Now.Month - time.Month) == 0)
            {
                if (Convert.ToInt32(DateTime.Now.Day - time.Day) == 0)
                {
                    if (Convert.ToInt32(DateTime.Now.Hour - time.Hour) == 0)
                    {
                        if (Convert.ToInt32(DateTime.Now.Minute - time.Minute) == 0)
                        {
                            if(DateTime.Now.Second - time.Second>0)
                                return (DateTime.Now.Second - time.Second).ToString() + "秒前";
                            else
                                return (time.Second - DateTime.Now.Second).ToString() + "秒后";
                        }
                        else
                        {
                            if(DateTime.Now.Minute - time.Minute>0)
                                return (DateTime.Now.Minute - time.Minute).ToString() + "分钟前";
                            else
                                return (time.Minute - DateTime.Now.Minute).ToString() + "分钟后";
                        }
                    }
                    else
                    {
                        if(DateTime.Now.Hour - time.Hour>0)
                            return (DateTime.Now.Hour - time.Hour).ToString() + "小时前";
                        else
                            return (time.Hour - DateTime.Now.Hour).ToString() + "小时后";
                    }
                }
                else
                {
                    if(DateTime.Now.Day - time.Day>0)
                        return (DateTime.Now.Day - time.Day).ToString() + "天前";
                    else
                        return (time.Day - DateTime.Now.Day).ToString() + "天后";
                }
            }
            else
            {
                if(DateTime.Now.Month - time.Month>0)
                    return (DateTime.Now.Month - time.Month).ToString() + "月前";
                else
                    return (time.Month - DateTime.Now.Month).ToString() + "月后";
            }
        }
        else
        {
            if(DateTime.Now.Year - time.Year>0)
                return (DateTime.Now.Year - time.Year).ToString() + "年前";
            else
                return (time.Year - DateTime.Now.Year).ToString() + "年后";
        }
    }
    //计算热度
    static public void calculateHot(string type, int id)
    {
        using (var db = new HuXiuEntities())
        {
            if (type == "activity")
            {
                Activity activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

                activity.activity_hot += 1;

                db.SaveChanges();
            }
            if (type == "news")
            {
                News news = db.News.SingleOrDefault(a => a.news_id == id);

                news.news_hot += 1;

                db.SaveChanges();
            }
        }
    }
    static public void calculateLike(int id)
    {
        using (var db = new HuXiuEntities())
        {
            News news = db.News.SingleOrDefault(a => a.news_id == id);

            news.news_like += 1;

            db.SaveChanges();
        }
    }

    static public int Test(string str)
    {
        if (str.Contains("<script>"))
            return 0;
        else
            return 1;
    }

}