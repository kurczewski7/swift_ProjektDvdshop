//
//  MasterTableViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 26.04.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
//        let titles = ["Ostatni wojownik","Ogniem i mieczem","Jak zostać królem"]
        let actors = ["Bruce Lee","Dustin Hoffman","Harisson Ford"]
        let types = ["Science ficton","Horror","Komedia romantyczna"]
        let prices = ["22.50","17.99","34.40"]
    
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
    var film: TypeOfFilm = .horror
    
    let  dvdFilm: (picture: String, title: String, actors: String, type: TypeOfFilm, price: String) = (picture: "obrazek",  title: "tytul",  actors: "Aktorzy", type: .horror, price: "Cena")
    var dvdFilms = [(picture: String, title: String, actors: String, type: TypeOfFilm, price: String)]()
    
    var myDvd = ("aaa", "bbb", "cccc", TypeOfFilm.komedia)
    //let(panstwo,stolica)=stolicePanstw[IndexPath.item]
    
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return obrazki.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MasterTableViewCell

        // Configure the cell...
        //cell.detailTextLabel?.text = "aaa"
        
        cell.DVDImage.image=UIImage(named: obrazki[indexPath.row])
        cell.titleLabel.text = tytuly[indexPath.row]
        cell.actorsLabel.text = actors[indexPath.row % 3]
        cell.typLabel.text = types[indexPath.row % 3]
        cell.priceLabel.text = prices[indexPath.row % 3]
        if indexPath.row % 3 == 2 {
            cell.backgroundColor=UIColor.green
        }
        else
        {
            cell.backgroundColor=UIColor.clear
            //cell.seec
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
