import Test.Hspec
import TP

main :: IO ()
main = hspec $ do
  describe "TP integrador" $ do

    -- Test punto 1
    it "Se incrementa la felicidad en 20 para el deseo de paz mundial" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaFelicidad pazMundial (felicidad humano) `shouldBe` 1900

    it "Se incrementa la felicidad en -50 para el deseo de ser famoso" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaFelicidad serFamoso (felicidad humano) `shouldBe` -50

    it "Se incrementa la felicidad en 250 para el deseo de recibirse de Ingeniería en Sistemas de Información" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaFelicidad (recibirseCarrera "Ingeniería en Sistemas de Información") (felicidad humano) `shouldBe` 250

    it "Se incrementa la felicidad en 250 para el deseo de recibirse de Medicina" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaFelicidad (recibirseCarrera "Medicina") (felicidad humano) `shouldBe` 250

    it "Se incrementa la felicidad en 250 para el deseo de recibirse de una carrera vacía" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaFelicidad (recibirseCarrera "") (felicidad humano) `shouldBe` 250

    it "Se incrementa el reconocimiento en 0 para el deseo de paz mundial" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaReconocimiento pazMundial (reconocimiento humano) `shouldBe` 0

    it "Se incrementa el reconocimiento en 1000 para el deseo de ser famoso" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaReconocimiento serFamoso (reconocimiento humano) `shouldBe` 1000

    it "Se incrementa el reconocimiento en 111 para el deseo de recibirse en Ingenieria en Sistemas de Informacion" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaReconocimiento (recibirseCarrera "Ingenieria en Sistemas de Informacion") (reconocimiento humano) `shouldBe` 111

    it "Se incrementa el reconocimiento en 24 para el deseo de recibirse en Medicina" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaReconocimiento (recibirseCarrera "Medicina") (reconocimiento humano) `shouldBe` 24

    it "Se incrementa el reconocimiento en 0 para el deseo de recibirse de una carrera vacía" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularDiferenciaReconocimiento (recibirseCarrera "") (reconocimiento humano) `shouldBe` 0

    -- Tests punto 2
    it "Se calcula la espiritualidad para el deseo de paz mundial" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularEspiritualidad humano pazMundial `shouldBe` 1900

    it "Se calcula la espiritualidad para el deseo de ser famoso" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularEspiritualidad humano serFamoso `shouldBe` -1050

    it "Se calcula la espiritualidad para el deseo de recibirse en Ingenieria en Sistemas de Informacion" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularEspiritualidad humano (recibirseCarrera "Ingenieria en Sistemas de Informacion") `shouldBe` 139

    it "Se calcula la espiritualidad para el deseo de recibirse en Medicina" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularEspiritualidad humano (recibirseCarrera "Medicina") `shouldBe` 226

    it "Se calcula la espiritualidad para el deseo de recibirse de una carrera vacía" $ do
      let humano = Humano "Zoe" 50 100 []
      calcularEspiritualidad humano (recibirseCarrera "") `shouldBe` 250
    
    -- Tests Punto 3
    it "La persona es menos feliz después de cumplir los deseos de paz mundial y ser famoso" $ do
      let persona = Humano "Zoe" 50 100 [pazMundial, serFamoso]
      esMasFeliz persona `shouldBe` False

    it "La persona es más feliz después de cumplir el deseo de paz mundial" $ do
      let persona = Humano "Zoe" 70 200 [pazMundial]
      esMasFeliz persona `shouldBe` True

    it "La persona es menos feliz después de cumplir el deseo de ser famoso" $ do
      let persona = Humano "Zoe" 80 150 [serFamoso]
      esMasFeliz persona `shouldBe` False

    it "La persona es mas feliz después de cumplir el deseo de recibirse de medico" $ do
      let persona = Humano "Zoe" 90 300 [recibirseCarrera "Medico"]
      esMasFeliz persona `shouldBe` True

    it "La persona no es mas feliz si no cumple deseos" $ do
      let persona = Humano "Zoe" 60 200 []
      esMasFeliz persona `shouldBe` False

    -- Tests Punto 4
    it "Los deseos terrenales de Zoe son 2" $ do
      let zoe = Humano "Zoe" 50 100 [pazMundial, serFamoso, recibirseCarrera "Medicina", recibirseCarrera "Ingenieria en Sistemas de Informacion"]
      let deseosTerrenales = filtrarDeseosTerrenales zoe
      length deseosTerrenales `shouldBe` 2

    it "Se calcula la felicidad más reconocimiento al cumplir el deseo de paz mundial para Zoe" $ do
      let zoe = Humano "Zoe" 50 100 [pazMundial]
      let felicidadReconocimiento = calcularFelicidadMasReconocimiento zoe pazMundial
      felicidadReconocimiento `shouldBe` 2050

    it "Cumplir el deseo de recibir el título de Ingenieria en Sistemas de Informacion para Zoe" $ do
      let zoe = Humano "Zoe" 50 100 []
      let zoeCumpleDeseo = cumplirDeseo zoe (recibirseCarrera "Ingenieria en Sistemas de Informacion")
      felicidad zoeCumpleDeseo `shouldBe` 350
      reconocimiento zoeCumpleDeseo `shouldBe` 161

    -- Tests Punto 5
    let persona = Humano "Zoe" 50 100 []
    let lucifer = Demonio ["Federico", "Zoe", "Graciela"] [beelzebub, mazikeen]
    let beelzebub = Demonio ["Mariano"] [amenadiel]
    let mazikeen = Demonio ["Zoe"] []

    it "La persona es deudor del demonio" $ do
      esDeudor persona lucifer `shouldBe` True

    it "La persona no es deudor del demonio" $ do
      esDeudor persona beelzebub `shouldBe` False

    it "La persona es deudor de los subordinados del demonio" $ do
      esDeudor persona mazikeen `shouldBe` True

    -- Tests Punto 6
    -- let persona1 = Humano "Zoe" 60 200 [pazMundial, recibirseCarrera "Ingenieria en Sistemas de Informacion", recibirseCarrera "Medicina", serFamoso]
    -- let persona2 = Humano "Lucas" 80 150 [recibirseCarrera "Arquitectura", serFamoso]
    -- let demonio = Demonio ["Federico", "Zoe", "Graciela"] [beelzebub, mazikeen]









    