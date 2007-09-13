all: doc_html

doc_html: html-stamp

html-stamp: grml-policy.txt
	asciidoc -a toc -a numbered grml-policy.txt
	touch html-stamp

clean:
	rm -rf html-stamp grml-policy.html

online: doc_html
	scp grml-policy.html grml:/var/www/grml/policy/index.html

distclean:
	rm -rf grml-policy.html html-stamp
