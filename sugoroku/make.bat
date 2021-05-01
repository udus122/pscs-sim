@echo off
rem This file is automatically generated.

if "%1" == "run" goto run
if "%1" == "two" goto two
if "%1" == "tlong" goto tlong
if "%1" == "long" goto long
goto run

:run
@echo on
@echo '=========== trap = 1'
ruby .\sugoroku.rb -t=1 1000 | ruby ..\count.rb
@echo '=========== trap = 5'
ruby .\sugoroku.rb -t=5 1000 | ruby ..\count.rb
@echo '=========== trap = 10'
ruby .\sugoroku.rb -t=10 1000 | ruby ..\count.rb
@echo off
goto end

:two
@echo on
@echo '=========== trap = 10,20'
ruby .\sugoroku.rb -t=10,20 1000 | ruby ..\count.rb
@echo '=========== trap = 10,15'
ruby .\sugoroku.rb -t=10,15 1000 | ruby ..\count.rb
@echo '=========== trap = 10,11'
ruby .\sugoroku.rb -t=10,11 1000 | ruby ..\count.rb
@echo off
goto end

:tlong
@echo on
@echo '=========== trap = 10,20'
ruby .\sugoroku.rb -t=10,20 10000 | ruby ..\count.rb
@echo '=========== trap = 10,15'
ruby .\sugoroku.rb -t=10,15 10000 | ruby ..\count.rb
@echo '=========== trap = 10,11'
ruby .\sugoroku.rb -t=10,11 10000 | ruby ..\count.rb
@echo off
goto end

:long
@echo on
@echo '=========== trap = 1'
ruby .\sugoroku.rb -t=1 10000 | ruby ..\count.rb
@echo '=========== trap = 5'
ruby .\sugoroku.rb -t=5 10000 | ruby ..\count.rb
@echo '=========== trap = 10'
ruby .\sugoroku.rb -t=10 10000 | ruby ..\count.rb
@echo off
goto end

:end
