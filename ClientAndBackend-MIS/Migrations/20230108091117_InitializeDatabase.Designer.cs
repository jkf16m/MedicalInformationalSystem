﻿// <auto-generated />
using System;
using ClientAndBackend_MIS.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace ClientAndBackendMIS.Migrations
{
    [DbContext(typeof(MISContext))]
    [Migration("20230108091117_InitializeDatabase")]
    partial class InitializeDatabase
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.1")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.ConsultationRoomSection.ConsultationRoom", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.HasKey("Id");

                    b.ToTable("ConsultationRoom");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.DoctorSection.Doctor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int?>("LivingAddressId")
                        .HasColumnType("int");

                    b.Property<int?>("NameId")
                        .HasColumnType("int");

                    b.Property<int>("ProfessionalLicenseNumber")
                        .HasColumnType("int");

                    b.Property<int?>("SalaryId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("LivingAddressId");

                    b.HasIndex("NameId");

                    b.HasIndex("SalaryId");

                    b.ToTable("Doctor");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.PatientSection.Patient", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int?>("DoctorId")
                        .HasColumnType("int");

                    b.Property<int?>("LivingAddressId")
                        .HasColumnType("int");

                    b.Property<int?>("NameId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("DoctorId");

                    b.HasIndex("LivingAddressId");

                    b.HasIndex("NameId");

                    b.ToTable("Patient");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.Shared.Address", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("City")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PostalCode")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("State")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Address");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.Shared.Illness", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("PatientId")
                        .HasColumnType("int");

                    b.Property<string>("Symptoms")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("PatientId");

                    b.ToTable("Illness");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.Shared.Money", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("Centavos")
                        .HasColumnType("int");

                    b.Property<int>("Pesos")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("Money");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.Shared.PersonName", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("FatherLastName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MiddleName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MotherLastName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("PersonName");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.DoctorSection.Doctor", b =>
                {
                    b.HasOne("ClientAndBackend_MIS.Entities.Shared.Address", "LivingAddress")
                        .WithMany()
                        .HasForeignKey("LivingAddressId");

                    b.HasOne("ClientAndBackend_MIS.Entities.Shared.PersonName", "Name")
                        .WithMany()
                        .HasForeignKey("NameId");

                    b.HasOne("ClientAndBackend_MIS.Entities.Shared.Money", "Salary")
                        .WithMany()
                        .HasForeignKey("SalaryId");

                    b.Navigation("LivingAddress");

                    b.Navigation("Name");

                    b.Navigation("Salary");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.PatientSection.Patient", b =>
                {
                    b.HasOne("ClientAndBackend_MIS.Entities.DoctorSection.Doctor", null)
                        .WithMany("Patients")
                        .HasForeignKey("DoctorId");

                    b.HasOne("ClientAndBackend_MIS.Entities.Shared.Address", "LivingAddress")
                        .WithMany()
                        .HasForeignKey("LivingAddressId");

                    b.HasOne("ClientAndBackend_MIS.Entities.Shared.PersonName", "Name")
                        .WithMany()
                        .HasForeignKey("NameId");

                    b.Navigation("LivingAddress");

                    b.Navigation("Name");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.Shared.Illness", b =>
                {
                    b.HasOne("ClientAndBackend_MIS.Entities.PatientSection.Patient", null)
                        .WithMany("Illnesses")
                        .HasForeignKey("PatientId");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.DoctorSection.Doctor", b =>
                {
                    b.Navigation("Patients");
                });

            modelBuilder.Entity("ClientAndBackend_MIS.Entities.PatientSection.Patient", b =>
                {
                    b.Navigation("Illnesses");
                });
#pragma warning restore 612, 618
        }
    }
}
