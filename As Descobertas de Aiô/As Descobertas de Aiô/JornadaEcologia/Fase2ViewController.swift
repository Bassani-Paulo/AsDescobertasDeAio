
import UIKit

class Fase2ViewController: UIViewController {

    @IBOutlet weak var balaoView: UIView!
    @IBOutlet weak var maiaView: UIImageView!
    @IBOutlet weak var aioView: UIImageView!
    @IBOutlet weak var lblTexto: UILabel!
    @IBOutlet weak var indicadorBalaoMaia: UIImageView!
    @IBOutlet weak var indicadorBalaoAio: UIImageView!
    @IBOutlet weak var viewImagens: UIView!
    @IBOutlet weak var viewImagem1: UIImageView!
    @IBOutlet weak var viewImagem2: UIImageView!
    
    //componentes animados na história
    @IBOutlet weak var oculosView: UIImageView!
    @IBOutlet weak var lixoPlasticoView: UIImageView!
    @IBOutlet weak var lixoPapelView: UIImageView!
    @IBOutlet weak var lixoMetalView: UIImageView!
    @IBOutlet weak var lixoVidroView: UIImageView!
    @IBOutlet weak var lixoAcumuladoView: UIImageView!
    
    private var pagina = 0 //pagina das falas
    private var jornadaStorytelling:JornadaEcologica!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jornadaStorytelling = JornadaEcologica()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animarComponentes(pagina) //mostra primeira parte da animação
    }
    
    private func animarComponentes(_ pagina:Int){
        let animacao:()->Void
        let completion:((Bool) -> Void)?
        switch pagina {
        case 0:
            animacao = {
                self.maiaView.frame.origin = CGPoint(x: 175, y: 214)
                self.aioView.frame.origin = CGPoint(x: 584, y: 214)
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 1:
            animacao = {
                self.maiaView.image = UIImage(named: "maiaFeliz")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 2:
            animacao = {
                self.aioView.image = UIImage(named: "aioSurpreso")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 3:
            animacao = {
                self.aioView.image = UIImage(named: "aioNormal")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 4:
            animacao = {
                self.maiaView.image = UIImage(named: "maiaNormal")
                self.aioView.image = UIImage(named: "aioTriste")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 5:
            animacao = {
                self.maiaView.image = UIImage(named: "maiaFeliz")
                self.aioView.image = UIImage(named: "aioNormal")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 7:
            animacao = {
                self.aioView.image = UIImage(named: "aioSurpreso")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 8:
            animacao = {
                self.aioView.image = UIImage(named: "aioFeliz")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 9:
            animacao = {
                self.aioView.frame.origin = CGPoint(x: 492, y: 214)
                self.maiaView.frame.origin = CGPoint(x: -87, y: 214)
                self.maiaView.image.imageOrientation = .leftMirrored
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 10:
            animacao = {
                self.oculosView.isHidden = false
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 11:
            animacao = {
                self.maiaView.image.imageOrientation = .rightMirrored
                self.aioView.image = UIImage(named: "aioSurpreso")
                self.maiaView.frame.origin = CGPoint(x: 175, y: 198)
                self.aioView.frame.origin = CGPoint(x: 606, y: 214)
                self.oculosView.isHidden = true
                self.lixoAcumuladoView.isHidden = false
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 12:
            animacao = {
                self.aioView.image = UIImage(named: "aioNormal")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 14:
            animacao = {
                self.maiaView.image = UIImage(named: "maiaNormal")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 15:
            animacao = {
                self.maiaView.image = UIImage(named: "maiaTriste")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 16:
            animacao = {
                self.aioView.image = UIImage(named: "aioTriste")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 17:
            animacao = {
                self.aioView.image = UIImage(named: "aioNormal")
                self.maiaView.image = UIImage(named: "maiaNormal")
                self.lixoPlasticoView.isHidden = false
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 18:
            animacao = {
                self.aioView.image = UIImage(named: "aioSurpreso")
                self.lixoPapelView.isHidden = false
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 19:
            animacao = {
                self.maiaView.image = UIImage(named: "maiaFeliz")
                self.lixoMetalView.isHidden = false
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 20:
            animacao = {
                self.lixoVidroView.isHidden = false
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        case 21:
            animacao = {
                self.aioView.image = UIImage(named: "aioFeliz")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        default:
            animacao = {
                self.maiaView.image = UIImage(named: "maiaFeliz")
                self.aioView.image = UIImage(named: "aioFeliz")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        }
        
        UIView.animate(withDuration: 3.0, delay: 0.5, options: .curveEaseOut, animations: animacao, completion: completion)
    }
    
    private func mostrarTexto(_ pagina:Int){
        if let pag = jornadaStorytelling.getPagina(fase: 1, pagina: pagina){
            lblTexto.text = pag.texto
            indicadorBalaoAio.isHidden = pag.aio
            indicadorBalaoMaia.isHidden = pag.maia
            balaoView.isHidden = false
            
            //lógica de mostrar imagens específico para esta fase
            if(pag.imagensView.count > 0){
                viewImagens.isHidden = false
                viewImagem1.image = UIImage(named: pag.imagensView[0])
                if(pag.imagensView.count > 1){
                    viewImagem2.isHidden = false
                    viewImagem2.image = UIImage(named: pag.imagensView[1])
                }
            } else{
                viewImagens.isHidden = true
            }
        }
    }
    
    @IBAction func toqueTela(_ gesture:UITapGestureRecognizer){
            proximaPagina()
    }
    
    private func proximaPagina(){
        balaoView.isHidden = true
        pagina += 1
        if(pagina < jornadaStorytelling.getQuantidadePaginas(fase: 1)){
            animarComponentes(pagina)
        } else if(pagina == jornadaStorytelling.getQuantidadePaginas(fase: 1)){
            performSegue(withIdentifier: "irJogo", sender: self)
        }
    }

}
