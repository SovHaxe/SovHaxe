clean:
	rm -rf ./target/

build:
	haxelib install ./build.hxml --always
	haxe ./build.hxml

local:
	nekotools server -d ./target/neko

documents:
	rm -rf ./docs/
	haxe ./build.hxml -xml ./docs/xml/doc.xml -D doc-gen
	haxelib run dox -i ./docs/xml/doc.xml -o ./docs/html/