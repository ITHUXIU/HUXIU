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
}