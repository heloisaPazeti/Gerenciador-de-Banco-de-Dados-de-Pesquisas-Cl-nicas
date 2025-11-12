from MainProgram.objects import research as r

def Senha():
    return "123"

def DummyPesquisas():

    pesquisa1 = r.Pesquisa("Titulo Pesquisa 1", "Ciencia", "12/01/2004", "USP", "FAPESP", "Giovanni Campani", "Rodrigo, Almeida; Sara, Sauro; Liliane, Augusta", "Por que ciencias, afinal?")
    pesquisa2 = r.Pesquisa("Titulo Pesquisa 2", "Matematica", "12/02/2013", "Unicamp", "CNPQ", "Giovanni C.", "Rodrigo, A.; Sara, S.; Liliane, A.", "Por que matematica, afinal?")
    pesquisa3 = r.Pesquisa("Titulo Pesquisa 3", "Fisica", "12/04/2078", "UFRJ", "CAPES", "G. Campani", "R., Almeida; S., Sauro; L., Augusta", "Por que fisica, afinal?")
    return [pesquisa1, pesquisa2, pesquisa3]

