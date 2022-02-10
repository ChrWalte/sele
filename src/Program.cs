// imports
using Microsoft.Extensions.FileProviders;
using sele;

// builder for web application
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Logging.AddConsole();

// build the web application
var app = builder.Build();

// if development environment
if (app.Environment.IsDevelopment())
{
    // use these
    app.UseDeveloperExceptionPage();
}

// use these
app.UseAuthorization();

// serve static files settings
// environment variables take priority

// file location is for physical file location on a drive
var fileLocation = Environment.GetEnvironmentVariable(Constants.ServingFileLocationEnvironmentVariable)
    ?? app.Configuration[Constants.ServingFileLocationConfiguration];

// the request location to serve the file at: /request_location/file_name
var fileRequestPath = Environment.GetEnvironmentVariable(Constants.ServingFileRequestLocationEnvironmentVariable)
    ?? app.Configuration[Constants.ServingFileRequestLocationConfiguration];

// the port number to expose the files on
var portNumber = int.Parse(
    Environment.GetEnvironmentVariable(Constants.ServingPortNumberEnvironmentVariable)
    ?? app.Configuration[Constants.ServingPortNumberConfiguration]);

// allow for unsafe serving of any file type
var serveUnsafeFileTypes = bool.Parse(
    Environment.GetEnvironmentVariable(Constants.ServingUnsafeTypesEnvironmentVariable)
    ?? app.Configuration[Constants.ServingUnsafeTypesConfiguration]);

// checking:
if (fileLocation == null)
{
    Console.WriteLine("[FATAL]: fileLocation not provided.");
    return;
}
if (fileRequestPath == null)
{
    Console.WriteLine("[FATAL]: fileRequestPath not provided.");
    return;
}

// logging
var fileCount = Directory.GetFiles(fileLocation, "*", SearchOption.AllDirectories).Length;
Console.WriteLine($"[INFO]: Found fileLocation: {fileLocation} with {fileCount} initial file(s).");
if (fileCount == 0) Console.WriteLine($"[WARNING]: Serving with 0 initial files.");
Console.WriteLine($"[INFO]: Found fileRequestPath: {fileRequestPath}.");
Console.WriteLine($"[INFO]: Found portNumber: {portNumber}.");
Console.WriteLine($"[INFO]: Found serveUnsafeFileTypes: {serveUnsafeFileTypes}.");

// enable serve static files
var fileProvder = new PhysicalFileProvider(fileLocation);
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = fileProvder,
    RequestPath = fileRequestPath,
    ServeUnknownFileTypes = serveUnsafeFileTypes
});

// map controllers in \Controllers\ folder
// app.MapControllers();

// add a system ping endpoint (for testing!):
Console.WriteLine("[INFO]: Mapped: [/sele-system/ping]=>[{[sele-system]: pong!}].");
app.MapGet("sele-system/ping", () => "{[sele-system]: pong!}");

// logging:
app.UseHttpLogging();

// more logging:
Console.WriteLine($"[INFO]: Started.");
Console.WriteLine($"[INFO]: --- START OF ASP.NET LOGGING ---");

// run web application
// on given port
app.Run($"http://localhost:{portNumber}");

// more logging:
Console.WriteLine($"[INFO]: --- END OF ASP.NET LOGGING ---");
Console.WriteLine($"[INFO]: Exited.");