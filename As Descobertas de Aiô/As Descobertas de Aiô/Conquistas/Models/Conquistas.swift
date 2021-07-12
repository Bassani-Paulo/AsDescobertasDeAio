//
//  Conquistas.swift
//  As Descobertas de Aiô
//
//  Created by Bruno Dias Sepulveda on 06/07/21.
//

import Foundation

struct Conquistas {
    var todasConquistas = [
        "Geral": [
            Conquista(titulo: "Reciclagem", descricao: "Completar a jornada de reciclagem", imagem: "ReciclagemCompleta", concluida: false)
        ],
        "Reciclagem": [
            Conquista(titulo: "Reciclagem 1", descricao: "Completar a primeira fase da jornada de reciclagem", imagem: "Reciclagem1", concluida: true),
            Conquista(titulo: "Reciclagem 2", descricao: "Completar a segunda fase da jornada de reciclagem", imagem: "Reciclagem2", concluida: false),
            Conquista(titulo: "Reciclagem 3", descricao: "Completar a terceira fase da jornada de reciclagem", imagem: "ReciclagemCompleta", concluida: false)
        ]
    ]
}

struct Conquista {
    var titulo: String
    var descricao: String
    var imagem: String
    var concluida: Bool
}
