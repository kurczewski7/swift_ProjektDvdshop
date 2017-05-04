//
//  Kantor.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 04.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import Foundation
class Kantor  {
    var zloty: Double = 1.0
    var dolarKurs: Double
    var euroKurs: Double
    var totalPriceInZloty: Double = 0
    var numerKonta="58 1240 1112 1111 0010 0944 9739"
    var nrTransakcji: String="201703041655001234"
    var kursyWalut: [Double]=[1.0, 3.86, 4.21]
    var urlBanku: [String]=["https://www.payu.pl","https://www.paypal.com/pl/home","https://www.pekao24.pl","http://www.mbank.com.pl","https://aliorbank.pl","https://moj.raiffeisenpolbank.com"]
    var nazwaBanku: [String]=["PayU","PayPal", "PKO","mBank","Alior","Raiffeisen polbank"]
    var numerBanku: Int = 0

    init(){
        self.dolarKurs=kursyWalut[1]
        self.euroKurs=kursyWalut[2]
    }
    init(dolarKurs: Double, euroKurs: Double)
    {
        self.dolarKurs=dolarKurs
        self.euroKurs=euroKurs
    }
    func setTotalPrice(totalPrice: Double){
        self.totalPriceInZloty=totalPrice
    }
    func giveValuteText(country: Int) -> String
        
    {
        var wynik = ""
        switch country {
            case 0: wynik=String.init(format: "%7.2f zł", totalPriceInZloty)
            case 1: wynik=String.init(format: "%7.2f $",  totalPriceInZloty / dolarKurs)
            case 2: wynik=String.init(format: "%7.2f €",  totalPriceInZloty / euroKurs)
            default: wynik=""
        }
        return wynik
    }
    func giveKursText(country: Int) -> String {
        var wynik = ""
    switch country {
        case 0: wynik=String.init(format: "Kurs %5.2f", 1.0)
        case 1: wynik=String.init(format: "Kurs %5.2f za $",  dolarKurs)
        case 2: wynik=String.init(format: "Kurs %5.2f za €",  euroKurs)
        default: wynik=""
    }
    return wynik
    }
    func giveUrlBank(nrBanku: Int) -> String
    {
        return urlBanku[nrBanku]
    }
    func giveNameBank(nrBanku: Int) -> String
    {
        return nazwaBanku[nrBanku]
    }
    func giveBankCount() -> Int
    {
        return urlBanku.count
    }
    func giveCurrentBank() -> Int {
        return numerBanku
    }
    func setTransactionId()
    {
        nrTransakcji=""
        let date=Date()
        let calendar=Calendar.current
        let year=calendar.component(.year, from: date)
        let month=calendar.component(.month, from: date)
        let day=calendar.component(.day, from: date)
        let hour=calendar.component(.hour, from: date)
        let minute=calendar.component(.minute, from: date)
        let secunde=calendar.component(.second, from: date)

        let randomValue=arc4random_uniform(999)
        nrTransakcji=String.init(format: "%4d%02d%02d%02d%02d%02d%04d", year,month,day, hour,minute,secunde, randomValue)
    }
    func giveTransactionNumberTxt() -> String
    {
        return "Tranzakcja: \(nrTransakcji)"
    }
    
    

}

