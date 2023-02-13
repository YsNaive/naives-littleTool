@echo Downloading honkit...
call npm i honkit
@echo Import plugin...  1/12
call npm i gitbook-plugin-folding-chapters
@echo Import plugin...  2/12
call npm i gitbook-plugin-theme-code
@echo Import plugin...  3/12
call npm i gitbook-plugin-header-generator-rmp
@echo Import plugin...  4/12
call npm i gitbook-plugin-youtube
@echo Import plugin...  5/12
call npm i gitbook-plugin-toolbar
@echo Import plugin...  6/12
call npm i gitbook-plugin-signature
@echo Import plugin...  7/12
call npm i gitbook-plugin-hints
@echo Import plugin...  8/12
call npm i gitbook-plugin-timeline
@echo Import plugin...  9/12
call npm i gitbook-plugin-glossary-tooltip
@echo Import plugin... 10/12
call npm i gitbook-plugin-betterchinese
@echo Import plugin... 11/12
call npm i gitbook-plugin-code-pro
@echo Import plugin... 12/12
call npm i gitbook-plugin-page-toc-button

@echo Generate book.json

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

@echo Init honkit...
call npx honkit init

@echo ----------------------------------------------------
@echo  setup finish, checkout README for more information 
@echo ----------------------------------------------------
pause