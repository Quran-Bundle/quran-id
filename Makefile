.ONESHELL:

.PHONY: all
all: readme doc test cleanup

.PHONY: doc
doc:
	$(MAKE) -C doc
	cd doc || exit
	xelatex quran-id-doc
	xelatex quran-id-doc

.PHONY: test
test:
	$(MAKE) -C sample  quran-id-test.tex
	cd sample || exit
	xelatex quran-id-test
	cd .. || exit

.PHONY: cleanup
cleanup:
	$(MAKE) clean
	$(MAKE) clean -C doc -f ../Makefile
	$(MAKE) clean -C tex -f ../Makefile
	$(MAKE) clean -C sample -f ../Makefile

.PHONY: clean
clean:
	@rm -fv ./*.{aux,log,toc,idx,hd,out} ./*~

.PHONY: dev
dev:
	cd tex || exit
	sudo cp -v *.def quran-id.sty /usr/local/texlive/2023/texmf-dist/tex/xelatex/quran-id/

.PHONY: ctan
ctan:
	$(MAKE) cleanup
	mkdir -p quran-id/doc quran-id/tex
	cp -v README        quran-id
	cd tex || exit
	cp -v quran-id.sty  ../quran-id/tex
	cp -v qurantext-id*.translation.def ../quran-id/tex
	cd ../doc/ || exit
	cp -v quran-id-doc.pdf quran-id-doc.tex quran.png ../quran-id/doc
	cd ../sample || exit
	cp -v quran-id-test*    ../quran-id/doc
	cd ..
	zip -r quran-id.zip quran-id
	mv -fv quran-id.zip ..
	rm -rfv ../quran-id
	mv -fv quran-id ..

QURANDATE := $(shell grep "quraniddate{" tex/quran-id.sty | cut -d'{' -f2 | tr -d '}')
QURANVERSION := $(shell grep "quranidversion{" tex/quran-id.sty | cut -d'{' -f2 | tr -d '}')
YEAR := "$(shell echo ${QURANDATE} | cut -d'/' -f1)"
readme-file := README

.PHONY: readme
readme:
	@echo "_____________________" > "${readme-file}"
	@echo "The quran-id package" >> "${readme-file}"
	@echo "v${QURANVERSION}" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "The package is prepared for typesetting some of Indonesian translations of the Holy Quran." >> "${readme-file}"
	@echo -e "The supported translations are done  by \`Indonesian Ministry of Religious Affairs\`," >> "${readme-file}"
	@echo -e "and \`Jalal ad-Din al-Mahalli and Jalal ad-Din as-Suyuti\`." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "For more information, please see the documentation." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Current version release date: ${QURANDATE}" >> "${readme-file}"
	@echo "___________________" >> "${readme-file}"
	@echo "Seiied-Mohammad-Javad Razvian" >> "${readme-file}"
	@echo "javadr@gmail.com" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Copyright © ${YEAR}" >> "${readme-file}"
	@echo "It may be distributed and/or modified under the LaTeX Project Public License," >> "${readme-file}"
	@echo "version 1.3c or higher (your choice). The latest version of" >> "${readme-file}"
	@echo "this license is at: http://www.latex-project.org/lppl.txt" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "This work is “author-maintained” (as per LPPL maintenance status)" >> "${readme-file}"
	@echo "by Seiied-Mohammad-Javad Razavian." >> "${readme-file}"
