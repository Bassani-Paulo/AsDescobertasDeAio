import UIKit

class Fase1ViewController: UIViewController {

    @IBOutlet weak var btnProximo: UIButton!
    @IBOutlet weak var aioView: UIImageView!
    @IBOutlet weak var maiaView: UIImageView!
    @IBOutlet weak var lixoView: UIImageView!
    @IBOutlet weak var balaoView: UIView!
    @IBOutlet weak var lblTexto: UILabel!
    @IBOutlet weak var indicadorBalaoMaia: UIImageView!
    @IBOutlet weak var indicadorBalaoAio: UIImageView!
    
    private var posicaoViewInicial: CGPoint!
    private var posicaoTocadaInicial: CGPoint!
    
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
                self.aioView.frame.origin = CGPoint(x: 546, y: 214)
            }
            completion = {finished in
                self.aioView.image = UIImage(named: "aioTriste")
                self.mostrarTexto(self.pagina)
            }
        case 1:
            animacao = {
                self.maiaView.frame.origin = CGPoint(x: 117, y: 214)
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
        default:
            animacao = {
                self.maiaView.image = UIImage(named: "maiaFeliz")
            }
            completion = {finished in
                self.mostrarTexto(self.pagina)
            }
        }
        
        UIView.animate(withDuration: 3.0, delay: 0.5, options: .curveEaseOut, animations: animacao, completion: completion)
    }
    
    private func mostrarTexto(_ pagina:Int){
        if let pag = jornadaStorytelling.getPagina(fase: 0, pagina: pagina){
            lblTexto.text = pag.texto
            indicadorBalaoAio.isHidden = pag.aio
            indicadorBalaoMaia.isHidden = pag.maia
            balaoView.isHidden = false
        }
    }
    
    @IBAction func arrastarLixo(_ gesture:UIPanGestureRecognizer){
        if let viewTocada = gesture.view{
            if(gesture.state == .began){ //inicio do movimento
                posicaoViewInicial = viewTocada.frame.origin
                posicaoTocadaInicial = gesture.location(in: viewTocada)
                
                aioView.image = UIImage(named: "aioNormal")
            } else if(gesture.state == .changed){
                //atualiza posicao da view
                let xAtual = viewTocada.frame.origin.x + gesture.location(in: viewTocada).x - posicaoTocadaInicial.x
                let yAtual = viewTocada.frame.origin.y + gesture.location(in: viewTocada).y - posicaoTocadaInicial.y
                viewTocada.frame.origin = CGPoint(x: xAtual, y: yAtual)
            } else if(gesture.state == .ended){
                if(viewTocada.frame.intersects(lixoView.frame)){
                    viewTocada.removeFromSuperview()
                    proximaPagina()
                } else {
                    viewTocada.frame.origin = posicaoViewInicial
                }
            }
        }
    }
    
    @IBAction func toqueTela(_ gesture:UITapGestureRecognizer){
        if(pagina > 0){
            proximaPagina()
        }
    }
    
    private func proximaPagina(){
        balaoView.isHidden = true
        pagina += 1
        if(pagina < jornadaStorytelling.getQuantidadePaginas(fase: 0)){
            animarComponentes(pagina)
        } else if(pagina == jornadaStorytelling.getQuantidadePaginas(fase: 0)){
            performSegue(withIdentifier: "irMapa", sender: self)
        }
    }
}
