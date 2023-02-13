@echo off

:start
(

)


@REM @echo Downloading honkit...
@REM call npm i honkit
@REM @echo Import plugin...  1/12
@REM call npm i gitbook-plugin-folding-chapters
@REM @echo Import plugin...  2/12
@REM call npm i gitbook-plugin-theme-code
@REM @echo Import plugin...  3/12
@REM call npm i gitbook-plugin-header-generator-rmp
@REM @echo Import plugin...  4/12
@REM call npm i gitbook-plugin-youtube
@REM @echo Import plugin...  5/12
@REM call npm i gitbook-plugin-toolbar
@REM @echo Import plugin...  6/12
@REM call npm i gitbook-plugin-signature
@REM @echo Import plugin...  7/12
@REM call npm i gitbook-plugin-hints
@REM @echo Import plugin...  8/12
@REM call npm i gitbook-plugin-timeline
@REM @echo Import plugin...  9/12
@REM call npm i gitbook-plugin-glossary-tooltip
@REM @echo Import plugin... 10/12
@REM call npm i gitbook-plugin-betterchinese
@REM @echo Import plugin... 11/12
@REM call npm i gitbook-plugin-code-pro
@REM @echo Import plugin... 12/12
@REM call npm i gitbook-plugin-page-toc-button


:BookJson
(
    IF EXIST book.json (
        @echo book.json exist, do you want to reset?
        @echo [ Y/N ]
        CHOICE /c YN /n >nul

        IF errorlevel==2 (goto endCmd)
    )
    @echo Generate book.json...
    @echo >"book.json

    @echo {> book.json
    @echo   "title": "my title",>> book.json
    @echo   "author": "name",>> book.json
    @echo   "language": "en",>> book.json
    @echo   "plugins": [>> book.json
    @echo     "theme-code",>> book.json
    @echo     "folding-chapters",>> book.json
    @echo     "toolbar",>> book.json
    @echo     "code-pro",>> book.json
    @echo     "hints",>> book.json
    @echo     "gitbook-plugin-betterchinese",>> book.json
    @echo     "page-toc-button">> book.json
    @echo   ],>> book.json
    @echo   "pluginsConfig": {>> book.json
    @echo     "theme-default": {>> book.json
    @echo       "showLevel": false>> book.json
    @echo     },>> book.json
    @echo     "page-toc-button": {>> book.json
    @echo       "maxTocDepth": 2,>> book.json
    @echo       "minTocSize": 2 >> book.json
    @echo     }>> book.json
    @echo   }>> book.json
    @echo }>> book.json
)

@REM @echo Init honkit...
@REM call npx honkit init

:endCmd
@echo .
@echo --------------
@echo - cmd finish -
@echo --------------
pause
goto start