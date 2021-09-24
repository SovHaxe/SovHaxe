hx = haxe
hxlib = haxelib
src_path = src

# Get the libraries in the global directory, I'm sure this isn't the way to do this, but IntelliJ is being annoying about this.
a-en:
	echo 0 #return success!

get_completion:
	$(hxlib) install ./build.hxml --always
	$(hxlib) install ./build.hxml --global --always

clean:
	rm -rf ../target/

build:
	$(hxlib) install ./build.hxml --always
	$(hx) ./build.hxml

documents:
	rm -rf ./docs/
	$(hx) ./build.hxml -xml ../docs/xml/doc.xml -D doc-gen
	$(hxlib) run dox -i ../docs/xml/doc.xml -o ../docs/html/


