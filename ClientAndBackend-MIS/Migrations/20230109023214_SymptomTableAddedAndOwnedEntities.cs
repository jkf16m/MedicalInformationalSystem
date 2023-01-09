using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ClientAndBackendMIS.Migrations
{
    /// <inheritdoc />
    public partial class SymptomTableAddedAndOwnedEntities : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Doctor_Address_LivingAddressId",
                table: "Doctor");

            migrationBuilder.DropForeignKey(
                name: "FK_Doctor_Money_SalaryId",
                table: "Doctor");

            migrationBuilder.DropForeignKey(
                name: "FK_Doctor_PersonName_NameId",
                table: "Doctor");

            migrationBuilder.DropForeignKey(
                name: "FK_Patient_Address_LivingAddressId",
                table: "Patient");

            migrationBuilder.DropForeignKey(
                name: "FK_Patient_PersonName_NameId",
                table: "Patient");

            migrationBuilder.DropTable(
                name: "Address");

            migrationBuilder.DropTable(
                name: "Money");

            migrationBuilder.DropTable(
                name: "PersonName");

            migrationBuilder.DropIndex(
                name: "IX_Patient_LivingAddressId",
                table: "Patient");

            migrationBuilder.DropIndex(
                name: "IX_Patient_NameId",
                table: "Patient");

            migrationBuilder.DropIndex(
                name: "IX_Doctor_LivingAddressId",
                table: "Doctor");

            migrationBuilder.DropIndex(
                name: "IX_Doctor_NameId",
                table: "Doctor");

            migrationBuilder.DropIndex(
                name: "IX_Doctor_SalaryId",
                table: "Doctor");

            migrationBuilder.DropColumn(
                name: "LivingAddressId",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "NameId",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "Symptoms",
                table: "Illness");

            migrationBuilder.DropColumn(
                name: "LivingAddressId",
                table: "Doctor");

            migrationBuilder.RenameColumn(
                name: "SalaryId",
                table: "Doctor",
                newName: "Salary_Pesos");

            migrationBuilder.RenameColumn(
                name: "NameId",
                table: "Doctor",
                newName: "Salary_Centavos");

            migrationBuilder.AddColumn<string>(
                name: "LivingAddress_City",
                table: "Patient",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LivingAddress_PhoneNumber",
                table: "Patient",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LivingAddress_PostalCode",
                table: "Patient",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LivingAddress_State",
                table: "Patient",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name_FatherLastName",
                table: "Patient",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name_MiddleName",
                table: "Patient",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name_MotherLastName",
                table: "Patient",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name_Name",
                table: "Patient",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LivingAddress_City",
                table: "Doctor",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LivingAddress_PhoneNumber",
                table: "Doctor",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LivingAddress_PostalCode",
                table: "Doctor",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LivingAddress_State",
                table: "Doctor",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name_FatherLastName",
                table: "Doctor",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name_MiddleName",
                table: "Doctor",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name_MotherLastName",
                table: "Doctor",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name_Name",
                table: "Doctor",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Symptom",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Causes = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IllnessId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Symptom", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Symptom_Illness_IllnessId",
                        column: x => x.IllnessId,
                        principalTable: "Illness",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Symptom_IllnessId",
                table: "Symptom",
                column: "IllnessId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Symptom");

            migrationBuilder.DropColumn(
                name: "LivingAddress_City",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "LivingAddress_PhoneNumber",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "LivingAddress_PostalCode",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "LivingAddress_State",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "Name_FatherLastName",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "Name_MiddleName",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "Name_MotherLastName",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "Name_Name",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "LivingAddress_City",
                table: "Doctor");

            migrationBuilder.DropColumn(
                name: "LivingAddress_PhoneNumber",
                table: "Doctor");

            migrationBuilder.DropColumn(
                name: "LivingAddress_PostalCode",
                table: "Doctor");

            migrationBuilder.DropColumn(
                name: "LivingAddress_State",
                table: "Doctor");

            migrationBuilder.DropColumn(
                name: "Name_FatherLastName",
                table: "Doctor");

            migrationBuilder.DropColumn(
                name: "Name_MiddleName",
                table: "Doctor");

            migrationBuilder.DropColumn(
                name: "Name_MotherLastName",
                table: "Doctor");

            migrationBuilder.DropColumn(
                name: "Name_Name",
                table: "Doctor");

            migrationBuilder.RenameColumn(
                name: "Salary_Pesos",
                table: "Doctor",
                newName: "SalaryId");

            migrationBuilder.RenameColumn(
                name: "Salary_Centavos",
                table: "Doctor",
                newName: "NameId");

            migrationBuilder.AddColumn<int>(
                name: "LivingAddressId",
                table: "Patient",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "NameId",
                table: "Patient",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Symptoms",
                table: "Illness",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LivingAddressId",
                table: "Doctor",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Address",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    City = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PostalCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    State = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Address", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Money",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Centavos = table.Column<int>(type: "int", nullable: false),
                    Pesos = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Money", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PersonName",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FatherLastName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MiddleName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MotherLastName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PersonName", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Patient_LivingAddressId",
                table: "Patient",
                column: "LivingAddressId");

            migrationBuilder.CreateIndex(
                name: "IX_Patient_NameId",
                table: "Patient",
                column: "NameId");

            migrationBuilder.CreateIndex(
                name: "IX_Doctor_LivingAddressId",
                table: "Doctor",
                column: "LivingAddressId");

            migrationBuilder.CreateIndex(
                name: "IX_Doctor_NameId",
                table: "Doctor",
                column: "NameId");

            migrationBuilder.CreateIndex(
                name: "IX_Doctor_SalaryId",
                table: "Doctor",
                column: "SalaryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Doctor_Address_LivingAddressId",
                table: "Doctor",
                column: "LivingAddressId",
                principalTable: "Address",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Doctor_Money_SalaryId",
                table: "Doctor",
                column: "SalaryId",
                principalTable: "Money",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Doctor_PersonName_NameId",
                table: "Doctor",
                column: "NameId",
                principalTable: "PersonName",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Patient_Address_LivingAddressId",
                table: "Patient",
                column: "LivingAddressId",
                principalTable: "Address",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Patient_PersonName_NameId",
                table: "Patient",
                column: "NameId",
                principalTable: "PersonName",
                principalColumn: "Id");
        }
    }
}
