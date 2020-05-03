//
//  WordViewController.swift
//  Project1
//
//  Created by SWUCOMPUTER on 2020/05/02.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class WordViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var infoTitle: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    
    let wordArray: Array<String> = ["5G", "디지털치료", "얼굴인식기능", "인간증강", "푸드테크"]
    let infoArray: Array<String> =
        ["최대 속도가 20Gbps에 달하는 이동통신 기술로, 4세대 이동통신인 LTE에 비해 속도가 20배가량 빠르고, 처리 용량은 100배 많다.\n강점인 초저지연성과 초연결성을 통해 4차 산업혁명의 핵심 기술인 가상현실, 자율주행, 사물인터넷 기술 등을 구현할 수 있다.",
         "AR, VR 등을 활용하여 가상의 공간에서 치유를 경험하게 하는 기술을 뜻한다.\n소프트웨어 자체가 의약품과 같은 효능을 발휘해 현대인의 건강을 효과적으로 관리해 주는 IT 기술로 주목된다.\n2020년에는 가벼운 진동으로 두통과 복통을 완화하는 웨어러블 기기 등이 주목받을 것으로 전망되었다.",
         "인공지능을 기반으로 사람의 연령, 성별은 물론 감정까지 파악하는 기술을 뜻한다.\n얼굴인식 기술은 얼굴의 형태만으로 기기의 잠금이 해제되는 생체 인식 기술로 최근 대중화되기 시작했으며, 보안에 민감한 공항과 항공사에서도 도입이 시작됐다.\n2020년에는 얼굴인식을 통해 범죄자를 식별하는 등 다양한 방면에서 맹활약을 펼칠 것으로 전망된다.",
         "인간의 인지 기능과 신체적 능력을 높이기 위한 기술을 뜻한다.\n신체에 장비 및 기기를 장착시키는 기술로, 웨어러블 디바이스를 통해 장애인의 보행을 돕는 물리적 증강’을 비롯해 창의적인 일에 집중할 수 있는 환경을 제공해주는 ‘인지적 증강’까지 실현하여 인간의 능력을 개선해 줄 것으로 전망된다.",
         "식품’과 ‘기술’의 합성어로 식품 관련 산업에 4차 산업기술 등을 적용하여 이전보다 발전된 형태의 산업과 부가가치를 창출하는 기술을 뜻한다.\n푸드테크는 식품 생산과정에 로봇 등을 투입하여 식품의 생산성을 높이고 비용을 절감하기도 하며, 소비자의 식품 소비 관련 정보를 분석하여 맞춤형 상품이나 서비스를 제공하기도 한다. "]
    let imageName:Array = ["5G.jpg", "digital.JPG", "facial.jpg", "human.jpg", "food.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getInfo() {
        let index = pickerView.selectedRow(inComponent: 0)
        
        infoTitle.text = wordArray[index] + "?"
        infoLabel.text = infoArray[index]
        imageView.image = UIImage(named:imageName[index])
    }
    
    func numberOfComponents (in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView (_ pickerView: UIPickerView,
    numberOfRowsInComponent component:Int) -> Int{
        return wordArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return wordArray[row]
    }
}
