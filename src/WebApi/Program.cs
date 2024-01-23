using System.Data;
using Npgsql;
using Prometheus;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseHttpMetrics();

app.MapGet("/users", async (IConfiguration config) =>
{
    var connectionString = config.GetConnectionString("PgSql");
    await using var connection = new NpgsqlConnection(connectionString);

    await connection.OpenAsync();

    await using var command = connection.CreateCommand();
    command.CommandText = "select user_id, name, birth_date from public.users";
    command.CommandType = CommandType.Text;

    var result = new List<User>();

    await using var reader = await command.ExecuteReaderAsync();

    if (reader.HasRows)
    {
        while (await reader.ReadAsync())
        {
            var user = new User(reader.GetInt32("user_id"), reader.GetString("name"), reader.GetFieldValue<DateTime?>("birth_date"));
            result.Add(user);
        }
    }

    return Results.Ok(result);
});

app.MapMetrics();

app.Run();

internal record User(int Id, string Name, DateTime? BirthDate);