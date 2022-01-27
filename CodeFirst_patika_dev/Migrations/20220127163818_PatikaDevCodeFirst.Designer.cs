﻿// <auto-generated />
using System;
using CodeFirst_patika_dev;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace CodeFirst_patika_dev.Migrations
{
    [DbContext(typeof(PatikaDBContext))]
    [Migration("20220127163818_PatikaDevCodeFirst")]
    partial class PatikaDevCodeFirst
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.13")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Assistant", b =>
                {
                    b.Property<int>("AssistantId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("AssistantName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("AssistantSurname")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("AssistantId");

                    b.ToTable("Assistants");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Attendance", b =>
                {
                    b.Property<int>("AttendanceId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<float>("AttendanceWeek8")
                        .HasColumnType("real");

                    b.Property<int>("StudentId")
                        .HasColumnType("int");

                    b.Property<int>("SuccessId")
                        .HasColumnType("int");

                    b.HasKey("AttendanceId");

                    b.HasIndex("StudentId");

                    b.HasIndex("SuccessId");

                    b.ToTable("Attendances");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Education", b =>
                {
                    b.Property<int>("EducationId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("AssistantId")
                        .HasColumnType("int");

                    b.Property<string>("EducationName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("PartipantsId")
                        .HasColumnType("int");

                    b.Property<int>("TeacherId")
                        .HasColumnType("int");

                    b.HasKey("EducationId");

                    b.HasIndex("AssistantId");

                    b.HasIndex("TeacherId");

                    b.ToTable("Educations");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.EducationStudent", b =>
                {
                    b.Property<int>("EducationStudentId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("EducationId")
                        .HasColumnType("int");

                    b.Property<int>("StudentId")
                        .HasColumnType("int");

                    b.HasKey("EducationStudentId");

                    b.HasIndex("EducationId");

                    b.HasIndex("StudentId");

                    b.ToTable("EducationStudents");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Partipant", b =>
                {
                    b.Property<int>("PartipantId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("APartipantSurname")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("EducationId")
                        .HasColumnType("int");

                    b.Property<string>("PartipanttName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("PartipantId");

                    b.HasIndex("EducationId");

                    b.ToTable("Partipants");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Student", b =>
                {
                    b.Property<int>("StudentId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("StudentName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("StudentSurname")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("StudentId");

                    b.ToTable("Students");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Success", b =>
                {
                    b.Property<int>("SuccessId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("StudentId")
                        .HasColumnType("int");

                    b.Property<float>("SuccessStatus")
                        .HasColumnType("real");

                    b.HasKey("SuccessId");

                    b.HasIndex("StudentId");

                    b.ToTable("Successz");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Teacher", b =>
                {
                    b.Property<int>("TeacherId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("TeacherName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("TeacherSurname")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("TeacherId");

                    b.ToTable("Teachers");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Attendance", b =>
                {
                    b.HasOne("CodeFirst_patika_dev.Entity.Student", "Students")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("CodeFirst_patika_dev.Entity.Success", "Successz")
                        .WithMany()
                        .HasForeignKey("SuccessId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Students");

                    b.Navigation("Successz");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Education", b =>
                {
                    b.HasOne("CodeFirst_patika_dev.Entity.Assistant", "Assistants")
                        .WithMany()
                        .HasForeignKey("AssistantId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("CodeFirst_patika_dev.Entity.Teacher", "Teachers")
                        .WithMany()
                        .HasForeignKey("TeacherId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Assistants");

                    b.Navigation("Teachers");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.EducationStudent", b =>
                {
                    b.HasOne("CodeFirst_patika_dev.Entity.Education", "Educations")
                        .WithMany()
                        .HasForeignKey("EducationId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("CodeFirst_patika_dev.Entity.Student", "Students")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Educations");

                    b.Navigation("Students");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Partipant", b =>
                {
                    b.HasOne("CodeFirst_patika_dev.Entity.Education", null)
                        .WithMany("Partipants")
                        .HasForeignKey("EducationId");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Success", b =>
                {
                    b.HasOne("CodeFirst_patika_dev.Entity.Student", "Students")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Students");
                });

            modelBuilder.Entity("CodeFirst_patika_dev.Entity.Education", b =>
                {
                    b.Navigation("Partipants");
                });
#pragma warning restore 612, 618
        }
    }
}
