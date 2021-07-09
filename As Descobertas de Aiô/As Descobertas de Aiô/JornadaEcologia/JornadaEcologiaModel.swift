//
//  JornadaEcologiaModel.swift
//  As Descobertas de Aiô
//
//  Created by Manoela Ferreira on 08/07/21.
//

import Foundation

struct Pagina:Codable{
    var texto: String
    var maia: Bool //define se o indicador de fala da personagem Maia está escondido
    var aio: Bool //define se o indicador de fala do personagem Aio está escondido
    var imagensView: [String] //define o nome das imagens existentes dentro do balao de fala
}

struct PaginasArray:Codable {
    var pagina:[Pagina]
}

struct FasesArray:Codable {
    var fase:[PaginasArray]
}

class JornadaEcologica{
    var fases:FasesArray?
    
    init(){
        fases = importarData()
    }
    
    private func importarData() -> FasesArray?{
        var resultado: FasesArray?
        resultado = nil
        
        let url = Bundle.main.url(forResource: "EcologiaStorytelling", withExtension: "json")
        
        if let arquivo = url {
            do {
                let data = try Data(contentsOf: arquivo)
                resultado = try JSONDecoder().decode(FasesArray.self, from: data)
            } catch {
                resultado = nil
            }
        }
        
        return resultado
    }
    
    func getPagina(fase faseIndex: Int, pagina paginaIndex: Int) -> Pagina?{
        var resultado:Pagina?
        resultado = nil
        
        if let fasesArray = fases{
            if(faseIndex >= 0 && faseIndex < fasesArray.fase.count){
                let fase = fasesArray.fase[faseIndex]
                if(paginaIndex >= 0 && paginaIndex < fase.pagina.count){
                    resultado = fase.pagina[paginaIndex]
                }
            }
        }
        
        return resultado
    }
    
    func getQuantidadePaginas(fase faseIndex:Int) -> Int{
        var resultado = 0
        
        if let fasesArray = fases{
            if(faseIndex >= 0 && faseIndex < fasesArray.fase.count){
                let fase = fasesArray.fase[faseIndex]
                resultado = fase.pagina.count
            }
        }
        
        return resultado
    }
}
