﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class HuXiuEntities : DbContext
{
    public HuXiuEntities()
        : base("name=HuXiuEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public DbSet<Activity> Activity { get; set; }
    public DbSet<Admin> Admin { get; set; }
    public DbSet<Column> Column { get; set; }
    public DbSet<Interest> Interest { get; set; }
    public DbSet<News> News { get; set; }
    public DbSet<News_class> News_class { get; set; }
    public DbSet<Question> Question { get; set; }
    public DbSet<Rumor> Rumor { get; set; }
    public DbSet<sysdiagrams> sysdiagrams { get; set; }
    public DbSet<Top> Top { get; set; }
    public DbSet<Topic> Topic { get; set; }
}
