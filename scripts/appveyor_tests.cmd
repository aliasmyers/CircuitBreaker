@ECHO OFF

:: Run unit tests 
cd test\Steeltoe.CircuitBreaker.Hystrix.Core.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..
cd test\Steeltoe.CircuitBreaker.Hystrix.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..
cd test\Steeltoe.CircuitBreaker.Hystrix.MetricsEvents.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..
cd test\Steeltoe.CircuitBreaker.Hystrix.MetricsStream.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..
echo Unit Tests Pass
goto success
:failure
echo Unit Tests Failure
exit -1
:success