using Domain.Entities;
using Domain.Entities.Base;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace Infrastructure.Context
{
    public class PersistenceContext : DbContext
    {

        private readonly IConfiguration _config;

        public PersistenceContext(DbContextOptions<PersistenceContext> options, IConfiguration config) : base(options)
        {
            _config = config;
        }

        public DbSet<Person> Person { get; set; }
        public DbSet<Cell> Cell { get; set; }
        public DbSet<CellVehicle> CellVehicle { get; set; }
        public DbSet<Vehicle> Vehicle { get; set; }
        public DbSet<Parking> Parking { get; set; }
        public DbSet<ParkingInvoice> InvoiceParking { get; set; }
        public DbSet<ParkingValues> ParkingValues { get; set; }

        public async Task CommitAsync()
        {
            await SaveChangesAsync().ConfigureAwait(false);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            if (modelBuilder == null)
            {
                return;
            }

            modelBuilder.HasDefaultSchema(_config.GetValue<string>("SchemaName"));
            

            foreach (var entityType in modelBuilder.Model.GetEntityTypes())
            {
                var t = entityType.ClrType;
                if (typeof(DomainEntity).IsAssignableFrom(t))
                {
                    modelBuilder.Entity(entityType.Name).Property<DateTime>("CreatedOn").HasDefaultValueSql("GETDATE()");
                    modelBuilder.Entity(entityType.Name).Property<DateTime>("LastModifiedOn").HasDefaultValueSql("GETDATE()");
                }
            }
            base.OnModelCreating(modelBuilder);
        }
    }
}
