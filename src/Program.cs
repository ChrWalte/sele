// imports
using Microsoft.Extensions.FileProviders;

// builder for web application
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

// built web application
var app = builder.Build();

// configuration && environment properties from web application
// development || production
var configuration = app.Configuration;
var environment = app.Environment;

// if development environment
if (environment.IsDevelopment())
{
    // use these
    app.UseDeveloperExceptionPage();
}

// use these
app.UseAuthorization();

// disabled as https will be handled at top level
// app.UseHttpsRedirection();

// serve static files settings
var fileLocation = configuration["ServingFiles:FileLocation"];
var fileRequestPath = configuration["ServingFiles:RequestLocation"];
var serveUnsafeFileTypes = bool.Parse(configuration["ServingFiles:ServeUnsafeFileTypes"]);
var fileProvder = new PhysicalFileProvider(fileLocation);

// enable serve static files
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = fileProvder,
    RequestPath = fileRequestPath,
    ServeUnknownFileTypes = serveUnsafeFileTypes
});

// NOT USED NOW!
// map controllers in \Controllers\ folder
// app.MapControllers();

// run web application
app.Run();