//
//  AppDelegate.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 25.04.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit
import CoreData

enum TypeOfFilm {
    case komedia
    case horror
    case sensacja
    case kostiumowy
    case wojenny
    case obyczajowy
    case dlaDzieci
    case muzyczny
}
var polubienia: [Bool] = []
var typyFilmow: [TypeOfFilm] = []
var cenyFilmow: [Double] = []
var youtubeUrls: [String]=["Teig07gHEY8","MZk4AbdcSvE","rzlHEPmz0E4","ttm0wH1mVnQ","yqHgLFKIo50","sb6Z47Qfzt8","Tw9ILjZFjec","71_E3Hh2Jqg","jxfoDDmNQtM","jGRg8DQleZI",
                           "ldSUFmGJ6_8","m1RDsbxJWyQ"]


var opisyFilmow: [String] = ["Przełom sierpnia i września 2012 roku. Młode małżeństwo – Melania (Magda Grąziowska) i Przemek (Bartosz Porczyk) – przyjeżdża do Warszawy, aby zająć się luksusowym apartamentem stryja (Jan Englert). Mieszkanie położone jest w centrum miasta, w miejscu gdzie od 1946 roku znajdował się parking, a przed wojną ambasada III Rzeszy. Młodzi bohaterowie nie podejrzewają, że przysługa oddana stryjowi zmieni się w największą przygodę ich życia, a także zmieni losy Warszawy, Polski, a nawet… całego świata!",
    "Incydent w Nangar Khel.Zamach na generała policji.Tajemnicze zniknięcie dziennikarzy.Zabójstwa na zlecenie.Scenariusz nowego thrillera Jacka Bromskiego, twórcy „Zabij mnie glino” zainspirowały najgłośniejsze sprawy kryminalne ostatnich lat, które wstrząsnęły Polską.Płatny zabójca o pseudonimie „Lulek” (Stroiński) dostaje propozycję nie do odrzucenia od skorumpowanego prokuratora (Głowacki). Ma zlikwidować komendanta Centralnego Biura Śledczego. „Lulek” angażuje do pomocy eks-snajpera Staszka (Kowalczyk) z elitarnej jednostki, który został kozłem ofiarnym nieudanej misji w Afganistanie, gdzie z ręki polskich żołnierzy zginęli cywile. Sprawa sięga najwyższych kręgów władzy i biznesu. Komendant stoi na drodze kontraktowi wartemu miliardy dolarów.",
    "a przezabawna animowana komedia przygodowa daje w końcu odpowiedź na pytanie, czemu ptaki są tak rozzłoszczone. Na rajskiej wyspie zamieszkałej całkowicie przez szczęśliwe nieloty - no, prawie całkowicie - Red, ptak o wybuchowym temperamencie, szybki Chuck i zmienny Bomba zawsze trzymali się na uboczu. Ale kiedy na wyspę przybywają tajemnicze zielone świnki, to właśnie do trójki tych dziwnych, niedobranych wyrzutków należy odkrycie jakie zamiary mają i co tak naprawdę knują zieloni goście.",
    "Ośmioletni Sebastian mieszka z dziadkiem w niewielkiej wiosce we francuskiej części Alp. Od pewnego czasu spokój tutejszych mieszkańców burzy wieść o grasującym w okolicy tajemniczym dzikim zwierzęciu. Pewnego dnia podczas spaceru po górach Sebastian spotyka na swojej drodze bezpańskiego owczarka. Udaje mu się zdobyć zaufanie zwierzęcia. Jest szczęśliwy, że znalazł przyjaciela. Wkrótce jednak okazuje się, że w psie, któremu chłopiec dał na imię Bella, dorośli widzą niebezpieczne zwierzę, dziesiątkujące stada owiec. Czy chłopcu uda się ich przekonać, że to nie sprawka sympatycznej Belli i wraz z nią wytropić prawdziwych winowajców?",
    "Porywająca opowieść o małej dziewczynce z sierocińca i tajemniczym Olbrzymie, który odkrywa przed nią cuda i sekrety magicznej krainy. W środku nocy, gdy wszyscy ludzie śpią w najlepsze, mroczne istoty wychodzą z ukrycia i przejmują na kilka chwil cały świat. Takie historie od dziecka słyszała rezolutna dziesięciolatka o imieniu Sophie. Nic więc dziwnego, że kiedy dziewczynka pewnej nocy nie mogła zasnąć, wygramoliła się z łóżka, założyła okulary i wychyliła przez okno, by ujrzeć świat w poświacie księżycowego blasku.Znana jej dobrze ulica dziś wyglądała jakoś inaczej… Nagle z cienia wynurzyło się coś ogromnego i zaczęło zmierzać w jej kierunku.",
    "Na Times Square zostaje znaleziona naga kobieta cierpiąca na amnezję, z ciałem pokrytym zagadkowymi tatuażami. Kim jest Jane Doe? Kto ją tak naznaczył? I co ją łączy z agentem FBI Kurtem Wellerem, którego imię znalazło się pośród tatuaży? W miarę jak Weller i jego zespół odszyfrowują tajemnicę, wkraczają w świat śmiertelnie niebezpiecznych intryg i konspiracji.",
    "Zrealizowane z rozmachem epickie widowisko producentów „Starcia Tytanów” i „Grawitacji”. Magia, mityczne istoty, bogowie i herosi w pełnej akcji i tajemnic opowieści czerpiącej z najstarszego dziedzictwa ludzkości.Set, bezwzględny bóg ciemności, siłą i podstępem przejmuje egipski tron. Faraon ginie, kapłani są bezsilni, a zwykli ludzie stają się niewolnikami. Tylko garstka buntowników stawia czoła uzurpatorowi, by ocalić imperium. Na ich czele staje bohaterski śmiertelnik Bek, który z pomocą potężnego i miłosiernego boga Horusa wyrusza w zaświaty i do samych niebios, by tam odnaleźć i pokonać Seta i jego hordy. Tak rozpoczyna się pełna niezwykłych przygód, magii i poświęceń krucjata śmiertelnika i boga w obronie naszego świata.",
    "Najlepszy film 39. Festiwalu Filmowego w Gdyni. Ponad 2 miliony widzów w kinach! Wizjoner, buntownik, lekarz, który rzucił wyzwanie naturze. Prawdziwa historia prof. Religi i pierwszego udanego przeszczepu serca. Niezwykła opowieść o buntowniku, który rzucił wyzwanie naturze, władzy i własnym ograniczeniom. O pierwszym udanym polskim przeszczepie serca dokonanym przezprof.Religę w Zabrzu. Dramat nieudanych operacji, walka o każde uderzenia serca, wielkie ambicje i bolesne porażki, samotność geniusza, który stanął sam przeciwkoswoim mentorom i rozpoczął rewolucję w polskiej medycynie. Jaką cenę musiał zapłacić za sukces? W rolę prof. Religi wcielił się rewelacyjny Tomasz Kot, a partneruje mu plejada najlepszych aktorów, m.in. Jan Englert, Kinga Preis, Zbigniew Zamachowski CzyPiotr Głowacki.",
    "Florence Foster Jenkins kochała muzykę ponad życie. Niestety bez wzajemności. Natura obdarzyła ją słuchem i głosem, które nawet głuchego doprowadziłyby do rozpaczy. Florence jednak pragnęła śpiewem podbić świat i w pewnym sensie jej się to udało. Jako dziedziczka sporej fortuny i narzeczona St. Clair Bayfielda - brytyjskiego aktora arystokraty, posiadała atuty, przy których jej brak talentu wydawał się nieistotną przeszkodą. Dzięki heroicznym staraniom ukochanego udawało się jej występować na Broadwayu i nagrywać płyty, a przede wszystkim wciąż wierzyć w swój dar. Jednak gdy zapragnęła ukoronować swój tryumf koncertem w słynnym Carnagie Hall nawet Bayfield wpadł w panikę.",
    "Laureaci Oscara ® Renée Zellweger i Colin Firth wraz z Patrickiem Dempseyem zapraszają na bardzo oczekiwaną trzecią odsłonę uwielbianej na całym świecie serii. Bridget, czterdziestoparoletnia (znów) singielka – po rozstaniu z Markiem Darcym (Firth), skupia się na pracy i kontaktach ze starymi i nowymi przyjaciółmi. Czeka ją jednak nowy zwrot w życiu, kiedy spotka energicznego Amerykanina Jacka (Dempsey), który uosabia wszystko to, czego brakuje Darcy’emu. Nieoczekiwanie Bridget odkrywa, że jest w ciąży, ale ma tylko 50 procent pewności, kto jest ojcem dziecka.",
    "Zainspirowana prawdziwymi wydarzeniami, przerażająca historia zrealizowana z udziałem laureatki Oscara Faye Dunaway („Chinatown”) oraz gwiazdy serii „Matrix” Carrie-Anne Moss.Trójka studentów wprowadza się do domku na przedmieściach. Już po kilku dniach mieszkania w nowym miejscu zaczynają doskwierać im choroby, a codzienną egzystencję zakłócają niewytłumaczalne zjawiska. Nie zdają sobie sprawy, że oto padli ofiarą klątwy związanej z popełnionym przed laty morderstwem. Ich prześladowca nazywa się Bye Bye Man. Każdy, kto choć w myślach wymówi jego imię, jest zgubiony. Czy grupce przyjaciół uda nie popaść w szaleństwo i oszukać przeznaczenie?"]
var x12=""
var x13=""
var x14=""
var x15=""
var x16=""
var x17=""
var x18=""
var x19=""
var x20=""
var x21=""

var aktorzy: [String] = ["Grąziowska Magdalena",
                         "Kowalczyk Marcin",
                         "Animacja",
                         "Karyo Tcheky",
                         "Rylance Mark",
                         "Stapleton Sullivan",
                         "Coster Waldau Nikolaj",
                         "Kot Tomasz",
                         "Streep Meryl",
                         "Zellweger Renee",
                         "Smith Douglas",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         "",
                         ""]


var rezyser:[String]=["Machulski Juliusz",
                      "Bromski Jacek",
                      "",
                      "",
                      "Spielberg Steven",
                      "Siega Marcos",
                      "Proyas Alex",
                      "Palkowski Łukasz",
                      "Frears Stephen",
                      "Maguire Sharon",
                      "Title Stacy",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      ""]

var listaUlubionych: [Int] = []

var zestawIcon: [Icon] = []

var kantor = Kantor()
//var daneTmp: (filmId: String, title: String, actors: String, type: TypeOfFilm, description: String, price: String, filmImage: UIImage, isLiked: Bool)
// = ("", "")


let obrazki = ["ambassada-dvd-w-iext36127150",
               "anatomia-zla-w-iext41886960",
               "angry-birds-film-w-iext46097674",
               "bella-i-sebastian-w-iext38074319",
               "bfg-bardzo-fajny-gigant-w-iext46630744",
               "blindspot-mapa-zbrodni-sezon-1-w-iext48334703",
               "bogowie-egiptu-w-iext43323379",
               "bogowie-w-iext43244828",
               "boska-florence-w-iext48322994",
               "bridget-jones-3-w-iext47427184",
               "bye-bye-man-w-iext48532608",
               "chrzest-w-iext43764621",
               "cos-za-mna-chodzi-w-iext36445885",
               "czerwony-pajak-w-iext43905752",
               "dluga-noc-w-iext47988326",
               "dzien-patriotow-w-iext48526279",
               "dziewczyna-z-pociagu-w-iext47506764",
               "ekstradycja-2-w-iext36385492",
               "faceci-w-czerni-3-w-iext36387668",
               "fantastyczne-zwierzeta-i-jak-je-znalezc-edycja-kolekcjonerska-z-kartami-zwierzat-w-iext48388343",
               "firmowa-gwiazdka-w-iext48518586",
               "geniusze-zbrodni-w-iext48064000",
               "gra-o-tron-sezon-5-w-iext36447881",
               "gra-o-tron-sezon-6-w-iext46041197",
               "gwiezdne-wojny-przebudzenie-mocy-w-iext48175252",
               "gwiezdne-wojny-trylogia-1-3-w-iext37626406",
               "gwiezdne-wojny-trylogia-4-6-w-iext37628222",
               "harry-potter-i-kamien-filozoficzny-2-plytowa-edycja-specjalna-w-iext44945419",
               "hel-w-iext36371403",
               "igrzyska-smierci-kosoglos-czesc-2-w-iext36479221",
               "iluzja-2-w-iext46349834",
               "inferno-w-iext47889398",
               "jack-reacher-nigdy-nie-wracaj-w-iext48264577",
               "jak-zostac-krolem-w-iext36382885",
               "jestem-morderca-w-iext48002587",
               "john-wick-w-iext48027863",
               "karbala-w-iext44917781",
               "komisja-morderstw-sezon-1-w-iext47889317",
               "kosmoloty-niezwykla-nagroda-w-iext47889312",
               "kronika-w-iext38903732",
               "kryptonim-u-n-c-l-e-premium-collectiion-w-iext48324648",
               "ksiega-dzungli-w-iext40422538",
               "la-la-land-edycja-specjalna-z-muzyka-z-filmu-w-iext48784032",
               "la-la-land-w-iext48784025",
               "lego-ninjago-noc-duchow-wydanie-specjalne-w-iext47438041",
               "letnie-przesilenie-w-iext43244824",
               "liga-sprawiedliwosci-mrok-w-iext48787841",
               "lion-droga-do-domu-w-iext48518607",
               "lotr-1-gwiezdne-wojny-historie-w-iext48329410",
               "lowca-i-krolowa-lodu-w-iext44171619",
               "magiczne-drzewo-w-iext36959259",
               "makbet-w-iext43763509",
               "maly-ksiaze-w-iext36331318",
               "max-steel-zjednoczenie-w-iext37908490",
               "moj-przyjaciel-orzel-w-iext44702242",
               "moje-skarby-w-iext48867533",
               "most-szpiegow-w-iext40580640",
               "na-granicy-w-iext44456427",
               "najdluzszy-marsz-billy-ego-lynna-w-iext48226469",
               "nerve-w-iext47519083",
               "niepewne-w-iext47988331",
               "niezgodna-w-iext43327157",
               "nowy-poczatek-wydanie-z-ksiazka-w-iext48263937",
               "opowiesci-z-narnii-lew-czarownica-i-stara-szafa-w-iext36413812",
               "osobliwy-dom-pani-peregrine-w-iext47894955",
               "pakiet-percy-jackson-czesc-1-i-2-w-iext43038745",
               "pasazerowie-wydanie-z-ksiazka-w-iext48584895",
               "piecdziesiat-twarzy-greya-w-iext40689188",
               "box-pippi-langstrumpf-serial-wedrowki-pippi-w-iext48903188",
               "planeta-ziemia-2-w-iext48099543",
               "poskromienie-zlosnicy-w-iext44264701",
               "przelecz-ocalonych-w-iext48055460",
               "roza-w-iext41962627",
               "rzeka-tajemnic-premium-collection-w-iext48339111",
               "sherlock-seria-4-w-iext48143478",
               "siedem-minut-po-polnocy-w-iext48842469",
               "siedmiu-wspanialych-wydanie-z-ksiazka-w-iext47889415",
               "sing-wydanie-specjalne-w-iext48787937",
               "sinister-w-iext43763707",
               "sklep-dla-samobojcow-w-iext45108889",
               "slugi-boze-w-iext47432088",
               "smerfy-niech-zyje-wazniak-w-iext36348185",
               "smietanka-towarzyska-w-iext47313944",
               "spider-man-1-w-iext36368470",
               "sposob-na-morderstwo-w-iext48532765",
               "spotlight-wydanie-z-ksiazka-w-iext43069711",
               "star-trek-w-nieznane-wydanie-z-ksiazka-w-iext46539932",
               "sufrazystka-w-iext41755521",
               "sully-w-iext48226506",
               "super-8-w-iext36392088",
               "sybir-bez-przeklenstw-sybir-wspomnien-w-iext43248650",
               "szybcy-i-wsciekli-6-w-iext48870501",
               "tajemnica-filomeny-w-iext43761792",
               "teoria-wszystkiego-w-iext43243906",
               "tess-d-urbervilles-w-iext43238329",
               "trolle-wydanie-z-muzyka-z-filmu-w-iext48229586",
               "umysl-przestepcy-w-iext44576969",
               "underworld-wojny-krwi-w-iext48518784",
               "upadek-krolestwa-sezon-1-w-iext48871112",
               "upadli-w-iext48532605",
               "w-obliczu-przeznaczenia-w-iext46026714",
               "warcraft-poczatek-w-iext44170260",
               "whiplash-w-iext43243860",
               "wzburzenie-opowiesc-o-dojrzewaniu-w-iext48532754",
               "zakladnik-z-wall-street-w-iext45092058",
               "zanim-sie-pojawiles-w-iext46092405",
               "ze-wszystkich-sil-dvd-w-iext38095782",
               "ziarno-prawdy-w-iext43564218",
               "zjawa-w-iext42994042",
               "zwierzeta-nocy-w-iext48398062",
               "zywiol-deepwater-horizon-w-iext47519134"]

let tytuly=["Ambassada",
            "Anatomia zła",
            "Angry birds film",
            "Bella i Sebastian",
            "Bfg bardzo fajny gigant",
            "Blindspot mapa zbrodni sezon 1",
            "Bogowie Egiptu",
            "Bogowie",
            "Boska Florence",
            "Bridget Jones 3",
            "Bye bye man",
            "Chrzest",
            "Coś za mną chodzi",
            "Czerwony pająk",
            "Długa noc w",
            "Dzień patriotów",
            "Dziewczyna z pociągu",
            "Ekstradycja 2",
            "Faceci w czerni 3",
            "Fantastyczne zwierzęta i jak je znaleźć edycja kolekcjonerska z kartami zwierząt",
            "Firmowa gwiazdka",
            "Geniusze zbrodni",
            "Gra o tron sezon 5",
            "Gra o tron sezon 6",
            "Gwiezdne wojny przebudzenie mocy",
            "Gwiezdne wojny trylogia 1 3",
            "Gwiezdne wojny trylogia 4 6",
            "Harry Potter i kamień filozoficzny 2 płytowa edycja specjalna",
            "Hel",
            "Igrzyska śmierci Kosogłos cześć 2",
            "Iluzja 2",
            "Inferno",
            "Jack Reacher nigdy nie wracaj",
            "Jak zostać królem",
            "Jestem mordercą",
            "John Wick",
            "Karbala",
            "Komisja morderstw sezon 1",
            "Kosmoloty niezwykła nagroda",
            "Kronika",
            "Kryptonim u n c l e - premium collectiion",
            "Księga dżungli",
            "La la land edycja specjalna z muzyka z filmu",
            "La la land",
            "Lego ninjago noc duchów wydanie specjalne",
            "Letnie przesilenie",
            "Liga sprawiedliwości mrok",
            "Lion droga do domu",
            "Łotr 1 gwiezdne wojny historie",
            "Łowca i królowa lodu",
            "Magiczne drzewo",
            "Makbet",
            "Mały ksiaże",
            "Max Steel zjednoczenie",
            "Mój przyjaciel orzeł",
            "Moje skarby",
            "Most szpiegów",
            "Na granicy",
            "Najdłuższy marsz Billy’ego Lynna",
            "Nerve",
            "Niepewne",
            "Niezgodna",
            "Nowy początek - wydanie z książką",
            "Opowieści z Narnii lew czarownica i stara szafa",
            "Osobliwy dom pani Peregrine",
            "Pakiet Percy Jackson część 1 i 2",
            "Pasażerowie wydanie z książką",
            "Pięćdziesiat twarzy Greya",
            "Pippi Langstrumpf serial wędrówki Pippi",
            "Planeta ziemia 2",
            "Poskromienie złośnicy",
            "Przełecz ocalonych",
            "Róza",
            "Rzeka tajemnic - premium collection",
            "Sherlock seria 4",
            "Siedem minut po północy",
            "Siedmiu wspaniałych wydanie z książką",
            "Sing wydanie specjalne",
            "Sinister",
            "Sklep dla samobójców",
            "Slugi boże",
            "Smerfy niech żyje Ważniak",
            "Smietanka towarzyska",
            "Spider man 1",
            "Sposob na morderstwo",
            "Spotlight wydanie z książką",
            "Star trek w nieznane wydanie z książką",
            "Sufrażystka",
            "Sully",
            "Super 8",
            "Sybir bez przekleństw sybir wspomnień",
            "Szybcy i wściekli 6",
            "Tajemnica Filomeny",
            "Teoria wszystkiego",
            "Tess d Urbervilles",
            "Trolle wydanie z muzyka z filmu",
            "Umysł przestępcy",
            "Underworld wojny krwi",
            "Upadek królestwa sezon 1",
            "Upadli",
            "W obliczu przeznaczenia",
            "Warcraft początek",
            "Whiplash",
            "Wzburzenie opowieść o dojrzewaniu",
            "Zakladnik z wall street",
            "Zanim się pojawiłeś",
            "Ze wszystkich sil dvd",
            "Ziarno prawdy",
            "Zjawa",
            "Zwierzeta nocy",
            "Żywioł deepwater horizon"]




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "DVDShop")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

