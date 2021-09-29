package web;



class Main {
    // This is the Index Page. This should be to make the Page actually Respond with HTML.
    // Different from Endpoints because Endpoints will just provide data.
    public static function main() {
        var page:Page = new Page("js/index.js");
        Sys.println(page.getPage());
    }
}
