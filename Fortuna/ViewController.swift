//
//  ViewController.swift
//  Fortuna
//
//  Created by andy on 14/10/18.
//  Copyright (c) 2014年 Andy Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quotationTextView: UITextView!
    var delegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
        displayRandomQuote()
        
    }
    func displayRandomQuote(){
        var quotes: [String] = arc4random_uniform(2) == 0 ?  delegate.negativeQuotes : delegate.positiveQuotes
        var count  = Int(arc4random_uniform(UInt32(quotes.count)))
        var quote: String = quotes[count]
        
        quotationTextView.text = quote
        quotationTextView.editable = false
        quotationTextView.selectable = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

