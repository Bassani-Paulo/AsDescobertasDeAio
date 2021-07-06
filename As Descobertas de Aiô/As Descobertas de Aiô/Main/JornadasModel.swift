//
//  JornadasModel.swift
//  As Descobertas de Aiô
//
//  Created by Manoela Ferreira on 05/07/21.
//

import Foundation

struct Jornada:Codable {
    var imagemFundo:String
    var bloqueado:Bool
}

struct JornadasArray:Codable {
    var jornadas:[Jornada]
}

class Jornadas {
    
    private var jornadasData:JornadasArray?
    
    init() {
        jornadasData = importarData()
    }
    
    private func importarData() -> JornadasArray?{
        var resultado:JornadasArray
        let arquivoURL = Bundle.main.url(forResource: "Jornadas", withExtension: "json")
        
        if let arquivo = arquivoURL {
            do {
                let data = try Data(contentsOf: arquivo)
                resultado = try JSONDecoder().decode(JornadasArray.self, from: data)
                
                return resultado
            } catch {
                print(error)
            }
        }
        
        return nil
    }
    
    func getJornadas() -> JornadasArray?{
        return jornadasData
    }
    
    func getJornada(i index:Int) -> Jornada?{
        var resultado:Jornada? = nil
        if let data = jornadasData{
            if(index >= 0 && index < data.jornadas.count){
                resultado = data.jornadas[index]
            }
        }
        return resultado
    }
}
