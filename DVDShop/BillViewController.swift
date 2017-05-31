//
//  BillViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 30.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class BillViewController: UIViewController {
    var tranzactionNoTmp = ""
    var totalPriceTmp = ""
    var totalValuteTmp = ""
    var isValute = false
    var userTmp: (fullName: String, codeAndCity: String, streetNo: String) = (fullName: "", codeAndCity: "", streetNo: "")
    

    @IBOutlet var rachunekSzczegolowyVebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var  filmy : [(title: String, price:String)] = [(title:"Ambassada",price:"55.20"), (title:"Bogowie wojny:",price:"25.50"), (title:"Joe", price:"99.20")]
        var jedenFilm: (title: String,price:String)
        let secondValute = isValute ? "(\(totalPriceTmp))" : ""
        

        
        //        let icon=zestawIcon[indexPath.row]
        //        let price_str = String(format: "%6.2f", icon.price)
        //        cell.filmImageView.image = UIImage(named: icon.name)
        //        cell.priceLabel.text = "\(price_str) zł"
        for i in 0..<zestawIcon.count {
            jedenFilm.title=zestawIcon[i].name
            jedenFilm.price=kantor.doubleToString(zestawIcon[i].price)
            filmy.append(jedenFilm)
        }
        
        let htmlString: String! = prepareHtml(tranzactionNo: tranzactionNoTmp , userAdress: userTmp, filmy: filmy,totalPrice: totalValuteTmp, secondValute: secondValute)
        rachunekSzczegolowyVebView.loadHTMLString(htmlString, baseURL: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func prepareHtml(tranzactionNo: String, userAdress: (fullName: String, codeAndCity: String, streetNo: String), filmy : [(title: String, price: String)] , totalPrice: String, secondValute: String) -> String
    {
        var haadHtml: String = ""
        var bodyHtml: String = ""
        var footerHtml: String = ""
        var adresatHtml: String = ""
        
        haadHtml+="<!DOCTYPE html><html><head><style>\n"
        haadHtml+="table {width:100%;} table, th, td {  border: 1px solid black;   border-collapse: collapse;  text-align: center;  }\n"
        haadHtml+="th {padding: 5px;text-align: center;}\n"
        haadHtml+="td  {   padding: 5px;  }\n"
        haadHtml+="table#t01 tr:nth-child(even) {   background-color: #eee;  }\n"
        haadHtml+="table#t01 tr:nth-child(odd)  {   background-color:#fff;   }"
        haadHtml+="table#t01 th                 {   background-color: gray;  }"
        haadHtml+="table#t02 table, th, td, thead, tfoot"
        haadHtml+="{"
        haadHtml+="    border: 0px solid black;"
        haadHtml+="    text-align: left;"
        haadHtml+="}"
        haadHtml+="table#t01 thead {  color:black;}"
        haadHtml+="table#t01 tfoot {  color:blue; }"
        haadHtml+="</style>"
        haadHtml+="</head>"
        haadHtml+="<body>"
        haadHtml+="<table id=\"t01\">"
        haadHtml+="<caption>Rachunek za filmy numer tranzakcji: <b>\(tranzactionNo)</b></caption>"
        haadHtml+="<thead>"
        haadHtml+="<tr>"
        haadHtml+="<th style=\"width:5%\">Lp</th>"
        haadHtml+="<th style=\"width:75%\">Tytuł filmu</th>"
        haadHtml+="<th>Cena</th>"
        haadHtml+="</tr>"
        haadHtml+="</thead>"
        haadHtml+="<tfoot>"
        haadHtml+="<tr>"
        haadHtml+="<th style=\"width:5%\">-</th>"
        haadHtml+="<th style=\"width:75%\">Suma za filmy \(secondValute)</th>"
        haadHtml+="<th>\(totalPrice)</th>"
        haadHtml+="</tr>"
        haadHtml+="</tfoot>"
        haadHtml+="<tr>"
        haadHtml+="</tr>"
        haadHtml+="<tr>"
        
        for i in 0..<filmy.count {
            bodyHtml+="<td>\(i+1)</td>"
            bodyHtml+="<td  style=\"text-align: left;\">\(filmy[i].title)</td>"
            bodyHtml+="<td>\(filmy[i].price)</td>"
            bodyHtml+="</tr>"
        }
//        let icon=zestawIcon[indexPath.row]
//        let price_str = String(format: "%6.2f", icon.price)
//        cell.filmImageView.image = UIImage(named: icon.name)
//        cell.priceLabel.text = "\(price_str) zł"
        
        
        footerHtml+="</table>"
        
        adresatHtml+="<table id=\"t02\" style=\"width:100%\">"
        adresatHtml+="<tr>"
        adresatHtml+="<th style=\"width:35%\"></th>"
        adresatHtml+="<th style=\"width:50%\">Adresat:</th>"
        adresatHtml+="<th></th>"
        adresatHtml+="</tr>"
        adresatHtml+="<tr>"
        adresatHtml+="<td></td>"
        adresatHtml+="<td>\(userAdress.fullName)</td>"
        adresatHtml+="<td></td>"
        adresatHtml+="</tr>"
        adresatHtml+="<tr>"
        adresatHtml+="<td></td>"
        adresatHtml+="<td>\(userAdress.codeAndCity)</td>"
        adresatHtml+="<td></td>"
        adresatHtml+="</tr>"
        adresatHtml+="<tr>"
        adresatHtml+="<td></td>"
        adresatHtml+="<td>\(userAdress.streetNo)</td>"
        adresatHtml+="<td></td>"
        adresatHtml+="</tr>"
        adresatHtml+="</table>"
        adresatHtml+="</body>"
        adresatHtml+="</html>"
        
        return haadHtml+bodyHtml+footerHtml+adresatHtml
    
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
