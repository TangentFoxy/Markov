markov = require "markov"
str = "This is an example string. This string is delicious. This is an example set of tacos."

example = markov(str)

for i = 1, 100
  print example\next!

print("--- --- ---")

strings = {
  "Hello world, this is a test."
  "I really don't know what I'm doing!"
  "This should be interesting."
  "I need more variation here."
  "Hello friends, I'm happy."
  "I should write more things with more variation in them."
  "In here is a little world, full of knowledge."
}

m2 = markov(strings)

math.randomseed os.time!

for i = 1, 10
  print(m2\string!)

for i = 1, 5
  print(m2\string max_length: 3)

elements = {
  "Hydrogen"
  "Helium"
  "Lithium"
  "Beryllium"
  "Boron"
  "Carbon"
  "Nitrogen"
  "Oxygen"
  "Fluorine"
  "Neon"
  "Sodium"
  "Magnesium"
  "Aluminium"
  "Silicon"
  "Phosphorus"
  "Sulfur"
  "Chlorine"
  "Argon"
  "Potassium"
  "Calcium"
  "Scandium"
  "Titanium"
  "Vanadium"
  "Chromium"
  "Manganese"
  "Iron"
  "Cobalt"
  "Nickel"
  "Copper"
  "Zinc"
  "Gallium"
  "Germanium"
  "Arsenic"
  "Selenium"
  "Bromine"
  "Krypton"
  "Rubidium"
  "Strontium"
  "Yttrium"
  "Zirconium"
  "Niobium"
  "Molybdenum"
  "Technetium"
  "Ruthenium"
  "Rhodium"
  "Palladium"
  "Silver"
  "Cadmium"
  "Indium"
  "Tin"
  "Antimony"
  "Tellurium"
  "Iodine"
  "Xenon"
  "Cesium"
  "Barium"
  "Lanthanum"
  "Cerium"
  "Praseodymium"
  "Neodymium"
  "Promethium"
  "Samarium"
  "Europium"
  "Gadolinium"
  "Terbium"
  "Dysprosium"
  "Holmium"
  "Erbium"
  "Thulium"
  "Ytterbium"
  "Lutetium"
  "Hafnium"
  "Tantalum"
  "Tungsten"
  "Rhenium"
  "Osmium"
  "Iridium"
  "Platinum"
  "Gold"
  "Mercury"
  "Thallium"
  "Lead"
  "Bismuth"
  "Polonium"
  "Astatine"
  "Radon"
  "Francium"
  "Radium"
  "Actinium"
  "Thorium"
  "Protactinium"
  "Uranium"
  "Neptunium"
  "Plutonium"
  "Americium"
  "Curium"
  "Berkelium"
  "Californium"
  "Einsteinium"
  "Fermium"
  "Mendelevium"
  "Nobelium"
  "Lawrencium"
  "Rutherfordium"
  "Dubnium"
  "Seaborgium"
  "Bohrium"
  "Hassium"
  "Meitnerium"
  "Darmstadtium"
  "Roentgenium"
  "Copernicium"
  "Nihonium"
  "Flerovium"
  "Moscovium"
  "Livermorium"
  "Tennessine"
  "Oganesson"
  "Ununennium"
  pattern: "%a" -- match individual letters
  order: 2
}

m3 = markov elements

print("---")

-- DEBUG showing internal state
for k,v in pairs m3.data
  print k
  for a,b in pairs v
    print "", b

print("---")

for i = 1, 20
  print(m3\string sep: "", max_length: 13)

print "START = #{markov.START}"
print "END = #{markov.END}"

other_things = {
  -- real non-elements
  "Dilithium"
  "Tritium"
  "Bronze"
  "Protium"
  -- fictional elements (http://lmntology.com/nameAsElementsWhite.php)
  "Gundanium"
  "Latinum"
  "Tyberium"
  "Quadium"
  "Adamantium"
  "Etherium"
  "Jasmium"
  "Mithril"
  "Xenium"
  "Rearden"
  "Zanium"
  -- fictional
  --  http://www.bbc.co.uk/comedy/lookaroundyou/series1/images/periodic1.gif
  --  http://www.bbc.co.uk/comedy/lookaroundyou/series1/images/periodic2.gif
  --  http://www.bbc.co.uk/comedy/lookaroundyou/series1/images/periodic3.gif
  "Marizapan" -- intentionally slightly different spelling
  "Segnomin"
  "Docherty"
  "Tedium"
  "Thankium"
  -- fictional (https://www.neuronsnotincluded.com/products/element-ah-fake-periodic-table-chemistry-elements)
  "Geekium"
  "Satisfactium"
  "Alarmose"
  "Cursium"
  "Brainium"
  -- real chemicals with funny names (http://www.chm.bris.ac.uk/sillymolecules/sillymols.htm)
  "Arsole"
  "Adamantane"
  "Bastardane"
  "Fullerene"
  "Putrescine"
  "Cadaverine"
  "Spermine"
  "Arabitol"
  "Fucitol"
  "Vomicine"
  "Gossypol"
  "Skatole"
  "Sparassol"
  "Psicose"
  "Nonanone"
  "Pubescine"
  "Funicone"
  "Housane"
  "Domperidone"
  "Germane"
  "Uranate"
  "Kunzite"
  "Spodumene"
  "Conantokin"
  "Cubane"
  "Anol"
  "Buccalin"
  "Dinile"
  "Fornacite"
  "Butanal"
  "Clitorin"
  "Fucol"
  "Ovalene"
  "Fuchsite"
  "Pagodane"
  "Apatite"
  "Lepidopterene"
  "Snoutene"
  "Cacodyl"
  "Screwene"
  "Furfuryl"
  "Carnallite"
  "Draculin"
  -- fictional (made up by me)
  "Toronton"
  "Praesium"
  "Halivalium"
  -- fictional (https://www.buymetalonline.co.uk/images/fictional_minerals.jpg)
  "Flubber"
  "Axonite"
  "Bolonium"
  "Corbomite"
  "Chronoton"
  "Capsidium"
  "Tylium"
  "Acoustium"
  "Necrogen"
  "Tiberium"
  "Metatron"
  "Chorizite"
  "Phazon"
  "Oxyale"
  "Magicite"
  "Balthazate"
  "Zydrine"
  "Morphite"
  "Tritanium"
  "Nocxium"
  "Elerium" -- numbers removed
  -- "Promethium" -- is a real element, you fools!
  "Infernium"
  "Timonium"
  "Neoteutonium"
  "Bendezium"
  "Hellion"
  "Moonsilver"
  "Soulsteel"
  "Orichalcum"
  "Uridium"
  "Psitanium"
  -- "Nvidium" -- really?
  "Zexonite"
  "Sinisite"
  "Tronium"
  "Zfylud"
  "Primium"
  "Jouronium"
  "Runite"
  "Technoorganic"
  "Vibranium"
  "Zuunium"
  "Nucleon"
  "Redstone"
  "Carbonite" -- also a real thing
  "Inerton"
  "Xenothium"
  "Energon"
  "Calculon"
  "Eternium"
  "Trioxin"
  "Unobtanium"
  "Elephantanium"
  "Turbidium"
  "Schwartz"
  "Balthorium"
  "Galvorn"
  "Byzantium"
  -- fictional (https://en.wikipedia.org/wiki/List_of_fictional_elements,_materials,_isotopes_and_subatomic_particles)
  "Aether"
  "Atium"
  "Australium"
  "Bavarium"
  "Byzanium"
  "Carbonadium"
  "Cavorite"
  "Chlorophyte"
  "Corrodium"
  "Divinium"
  "Duranium"
  "Durium"
  "Feminum"
  "Frinkonium"
  "Harbenite"
  "Lerasium"
  "Meteorillium"
  "Naqahdah"
  "Octiron"
  "Polydenum"
  "Saronite"
  "Saturnium"
  "Scrith"
  "Taydenite"
  "Uru"
  "Verterium"
  "Xirdalium"
  "Xithricite"
  "Quantium"
  "Philosophon"
  "Reson"
  "Tachyon"
  "Thaum"
  "Computronium"
  "Electrum"
  -- Trek
  "Neutronium" -- also a real thing
  "Nitrium"
  "Trilithium"
  "Kironide"
  "Pergium"
  "Cordrazine"
  "Inaprovaline"
  "Ketracel" -- removed "-White"
  "Retinax" -- removed "-5"
  "Archerite" -- fake ;)
  pattern: "%a"
  order: 2
}

for i = 1, #elements
  table.insert other_things, elements[i] -- complete the set with real elements

m4 = markov other_things

for i = 1, 20
  print(m4\string sep: "", max_length: 13)

print "---"
m3.sep = ""
print m3\string!

lorem_ipsum_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
m5 = markov lorem_ipsum_text
print m5\string!
