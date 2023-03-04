!!!!CONSIGLIO DI LEGGERE TUTTO POTREBBE DIPENDERE DAL FUNZIONAMENTO DELLO SCRIPT!!!!

Quando si crea un blip prima di restartare la risorsa si deve andare nel config/Blips.json dove di sicuro troverete il blip con tutte le righe pero
dovrete modificare alcune righe altrimenti lo script non funzionera corretamente.

ES:

[
    {
        "pos": {
            "x": 362.5872497558594,
            "y": -1397.1334228515626,
            "z": 76.17418670654297
        },
        "idblip": "3",
        "coloreblip": "7",
        "scaleblip": "0.8",
        "nomeblip": "blip prova"
    }
]

Questo è ciò che vi scrivera ma voi dovrete mettere cosi

[
    {
        "pos": {
            "x": 362.5872497558594,
            "y": -1397.1334228515626,
            "z": 76.17418670654297
        },
        "idblip": 3,
        "coloreblip": 7,
        "scaleblip": 0.8,
        "nomeblip": "blip prova"
    }
]

Altrimenti lo script non riuscira a trovare le informazioni se alcune cose le metterete tra Virgolette ""

-----------------------------------------------------------------------------------------------------------

                                                  EXPORT

Per Aprirlo Bastera o Fare il comando o usare L'export

exports.Fennel_Blips:openMenu()

----------------------------------------------------------------------------------------------------------


