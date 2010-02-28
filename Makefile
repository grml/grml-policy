all: doc_html

doc_html: html-stamp

# notice: we need to make sure we've source-highlight available,
# possible solution would be a build-depends once we've a Debian
# package for grml-policy, see http://bts.grml.org/grml/issue342

html-stamp: grml-policy.txt
	@echo "please make sure you have source-highlight installed"
	asciidoc -a toc -a numbered grml-policy.txt
	touch html-stamp

clean:
	rm -rf html-stamp grml-policy.html

online: doc_html
	scp grml-policy.html grml:/var/www/grml/policy/index.html

distclean:
	rm -rf grml-policy.html html-stamp
