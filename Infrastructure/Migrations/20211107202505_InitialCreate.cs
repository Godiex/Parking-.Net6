using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "block");

            migrationBuilder.CreateTable(
                name: "Parking",
                schema: "block",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    LastModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Parking", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ParkingValues",
                schema: "block",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MotorcycleHourValue = table.Column<double>(type: "float", nullable: false),
                    DayMotorcycleValue = table.Column<double>(type: "float", nullable: false),
                    CarHourValue = table.Column<double>(type: "float", nullable: false),
                    CarDayValue = table.Column<double>(type: "float", nullable: false),
                    ValueSurchange = table.Column<double>(type: "float", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    LastModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ParkingValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Person",
                schema: "block",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DateOfBirth = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    LastModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Person", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Vehicle",
                schema: "block",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Plaque = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Type = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Cylinders = table.Column<int>(type: "int", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    LastModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vehicle", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Cell",
                schema: "block",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Number = table.Column<int>(type: "int", nullable: false),
                    Busy = table.Column<bool>(type: "bit", nullable: false),
                    Type = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    LastModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    ParkingId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cell", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Cell_Parking_ParkingId",
                        column: x => x.ParkingId,
                        principalSchema: "block",
                        principalTable: "Parking",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CellVehicle",
                schema: "block",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CellId = table.Column<int>(type: "int", nullable: false),
                    VehicleId = table.Column<int>(type: "int", nullable: false),
                    EntryDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DepartureDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    State = table.Column<bool>(type: "bit", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    LastModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CellVehicle", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CellVehicle_Cell_CellId",
                        column: x => x.CellId,
                        principalSchema: "block",
                        principalTable: "Cell",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CellVehicle_Vehicle_VehicleId",
                        column: x => x.VehicleId,
                        principalSchema: "block",
                        principalTable: "Vehicle",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "InvoiceParking",
                schema: "block",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SurchangeValue = table.Column<double>(type: "float", nullable: false),
                    Subtotal = table.Column<double>(type: "float", nullable: false),
                    TotalValue = table.Column<double>(type: "float", nullable: false),
                    CellVehicleId = table.Column<int>(type: "int", nullable: false),
                    ParkingValuesId = table.Column<int>(type: "int", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()"),
                    LastModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "GETDATE()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InvoiceParking", x => x.Id);
                    table.ForeignKey(
                        name: "FK_InvoiceParking_CellVehicle_CellVehicleId",
                        column: x => x.CellVehicleId,
                        principalSchema: "block",
                        principalTable: "CellVehicle",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_InvoiceParking_ParkingValues_ParkingValuesId",
                        column: x => x.ParkingValuesId,
                        principalSchema: "block",
                        principalTable: "ParkingValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Cell_ParkingId",
                schema: "block",
                table: "Cell",
                column: "ParkingId");

            migrationBuilder.CreateIndex(
                name: "IX_CellVehicle_CellId",
                schema: "block",
                table: "CellVehicle",
                column: "CellId");

            migrationBuilder.CreateIndex(
                name: "IX_CellVehicle_VehicleId",
                schema: "block",
                table: "CellVehicle",
                column: "VehicleId");

            migrationBuilder.CreateIndex(
                name: "IX_InvoiceParking_CellVehicleId",
                schema: "block",
                table: "InvoiceParking",
                column: "CellVehicleId");

            migrationBuilder.CreateIndex(
                name: "IX_InvoiceParking_ParkingValuesId",
                schema: "block",
                table: "InvoiceParking",
                column: "ParkingValuesId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "InvoiceParking",
                schema: "block");

            migrationBuilder.DropTable(
                name: "Person",
                schema: "block");

            migrationBuilder.DropTable(
                name: "CellVehicle",
                schema: "block");

            migrationBuilder.DropTable(
                name: "ParkingValues",
                schema: "block");

            migrationBuilder.DropTable(
                name: "Cell",
                schema: "block");

            migrationBuilder.DropTable(
                name: "Vehicle",
                schema: "block");

            migrationBuilder.DropTable(
                name: "Parking",
                schema: "block");
        }
    }
}
