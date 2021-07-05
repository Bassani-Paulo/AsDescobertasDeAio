//import Foundation
//import Combine
//
////metodo que acessa user default
////metodo que grava um booleano nessa variável
////metodo que recupero
//public class PrimeiroUso: ObservableObject {
//	@Published var primeiroAcesso: Bool {
//		didSet {
//			UserDefaults.standard.set(primeiroAcesso, forKey: "primeiroAcesso")
//		}
//	}
//	init() {
//		self.username = UserDefaults.standard.object(forKey: "primeiroAcesso") as? Bool ?? true
//	}
//}
//@ObservedObject var configDeUsuario= configDeUsuario()
//configDeUsuario.primeiroAcesso = false
