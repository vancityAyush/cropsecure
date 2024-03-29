import 'dart:core';

/**
 * Created by : Ayush Kumar
 * Created on : 01-06-2022
 */
const List<String> handicapped = ["Yes", "No"];
const List<String> minority = ["Yes", "No"];
const List<String> caste = ["Gen", "OBC", "SC", "ST"];
const List<String> gender = ["Male", "Female", "Others"];
const List<String> farmerTypeD = ["Cattle", "Farmer or Plot"];
const List<String> selectUnit = [
  "Hectare",
  "Guntha",
  "Cent",
  "Bigha",
  "Marla",
  "Acre"
];
const List<String> kSoilType = [
  "Alluvial Soil",
  "Black Cotton Soil",
  "Red & Yellow Soil",
  "Laterite Soil.",
  "Mountainous or Forest Soil.",
  "Arid or Desert Soil",
  "Saline and Alkaline Soil",
  "Peaty and Marshy Soil"
];
const List<String> kWaterSource = [
  "Canal",
  "Waterpound",
  "Borewall",
  "River",
  "Rain"
];
const List<String> kSampleCollected = [
  " Field Team",
  "Officer",
  "Supervisor",
  "ATM/BTM",
  "Others"
];
const List<String> kExpenditureParticular = [
  "Land Rent",
  "Tractor",
  "Labour Wages",
  "Equipments ",
  "Input Amount",
  "Machines",
  "Soil Test ",
  "Transporatation",
  "Hessian Cloth",
  "Bags",
  "Equipments Rent",
  "Harvest Rent",
  "Hessian Cloth rent",
  "Field lease amount",
  "Others"
];
const List<String> kCropLoss = [
  "Weather",
  "Diesesses",
  "Heavy Rain",
  "Fire",
  "Salinity",
  "Temperature",
  "Wind Effect",
  "Others"
];
const List<String> kCropStages = [
  "Vegetative",
  "Reproductive",
  "Ripening",
  "Sowing",
  "Transplanting or Replanting ",
  "Fertilizers",
  "Pesticide",
  "Milking stage ",
  "Grain filling",
  "Maturing stage ",
  "Harvesting stage"
];
const List<String> kCropType = [
  "Cereals",
  "Grain Legumes",
  "Vegetables",
  "Fruits and Nuts",
  "Agriculture",
  "Horticulture",
  "Sericulture",
  "Floweriture",
  "Forestry",
  "Fruits"
];
const List<String> kCropName = [
  "Paddy",
  "Sorghum",
  "Wheat",
  "Green peas",
  "Yellow Peas",
  "Okra",
  "Pumpkin",
  " Gourd",
  "Karaunda",
  "Lime",
  "Iamun",
];
const List<String> kCropVariety = [
  "RNR",
  "Sona",
  "Ganga Kaveri",
  "IR 64",
  "Hybrid",
  "BSR",
  "Co Series",
  "Cow 1",
  "Wheat",
  "Samba",
  "HW 1095",
  "SRF",
  "GTR",
  "HYU",
  "GRY",
  "JIY",
  "HIY",
  "XYZ",
  "ABC",
  "PQR",
  "C-A",
  "C-B",
  "Bottle ",
  "Bitter ",
  "Ivy",
  "Ridged ",
  "UT 2",
  "UT 5",
  "UT 10",
  "Lime 250",
  "Lime 45",
  "Sr",
  "Dr"
];
const List<String> kSpecificTech = [
  "Direct Seeded Rice (DSR)",
  "Compartment Bund with pulse intercrop",
  "Sowing with Seed drill in Red gram",
  "Sowing with Seed drill in Bengal gram",
  "Drill sown with pulse intercrop",
  "Maize Intercrop with Avare",
  "Raised bed with pulse intercrop",
  "Seed Treatment and Nipping",
  "Siridhanya/Bajra sowing with pulse intercrop",
  "Demonstration on Stress tolerant verities",
  "Ragi intercrop Avare",
  "Nutri Cereals and Jowar Sowing",
  "Machine Transplanting in Rice",
  "Maize + Green Gram Intercrop",
  "Ground nut + Tur Intercropping",
  "New Variety soyabean (Soyabean LSD)",
  "Maize + Soyabean Intercrop",
  "Line Sowing in Black Gram",
  "Line Sowing in Green Gram",
  "Paddy – Green gram sequence",
  "Green gram + Tur Intercropping",
  "Mechanize Sowing",
  "Direct Sowing",
  "Transplanting",
  "Mechanised Transplanting",
  "Dibbling",
  "Sole Cropping",
  "Line Sowing",
  "Nipping",
  "Minikit",
  "SRI Method",
  "Direct line Sowing",
  "Nati Method",
  "Wide row Spacing",
  "Bund Planting",
  "Ragi Planting",
  "Optimum Spacing",
  "Tur intercrop Avare",
  "Ridges and Furrows",
  "Sugarcane with Pulses",
  "Line Sowing in Jowar",
  "Little Millet +Pulse Intercrop",
  "Pulse in paddy fallow",
  "Integrated Nutrient Management",
  "Maize + Tur Intercrop",
  "Paddy -Bengal gram sequence",
  "Tur pulse inter crop",
  "Proso Millet +Pulse Intercrop",
  "Line Sowing in Ragi",
  "Line sowing in Bengal gram",
  "Kodo Millet +Pulse Intercrop",
  "Varieties of Minor Millets",
  "Maize + Cowpea Intercrop",
  "Paddy -Black gram sequence",
  "Foliar Spray and Nipping",
  "Paddy - Green gram sequence",
  "Paddy - Cowpea sequence",
  "Transplanting method in Red gram",
  "Ragi With Pulses Inter Crop",
  "Foxtail Millet +Pulse Intercrop",
  "Line Sowing in   Bajra",
  "Barnyard Millet + Pulse Intercrop",
  "Ragi intercrop Red gram"
];
const List<String> kInsCompanyName = [
  "Agriculture Insurance Company",
  "Bajaj Allianz General Insurance Co. Ltd",
  "Bharti Axa General Insurance Company Ltd.",
  "Cholamandalam Ms General Insurance Company Limited",
  "Future Generali India Insurance Co. Ltd.",
  "Hdfc Ergo General Insurance Co. Ltd.",
  "Icici Lombard General Insurance Co. Ltd.",
  "Iffco Tokio General Insurance Co. Ltd.",
  "National Insurance Company Limited",
  "New India Assurance Company",
  "Oriental Insurance",
  "Reliance General Insurance Co. Ltd.",
  "Royal Sundaram General Insurance Co. Limited",
  "Sbi General Insurance",
  "Shriram General Insurance Co. Ltd.",
  "Tata Aig General Insurance Co. Ltd.",
  "United India Insurance Co.",
  "Universal Sompo General Insurance Company"
];

const List<String> kSeedSource = [
  "Govt",
  "Private",
  "Application",
  "Own Source",
  "Others"
];
const List<String> kAreaAffected = [
  "Hectare",
  "Guntha",
  "Cent",
  "Bigha",
  "Marla",
  "Acre"
];
const List<String> kSelectWeight = [
  "100 Kg",
  "75 Kg",
  "70 Kg",
  "50 Kg",
  "25 Kg",
  "10 Kg",
  "5  Kg",
  "2 Kg",
  "1 Kg"
];
const List<String> kCattleType = ["Cow", "Bull", "Calf", "Heifer"];
const List<String> kLifeStage = [
  "Calf",
  "Heat Detectiom Time",
  "Milking",
  "Pregent Milking",
  "Dry Period"
];
const List<String> kCattleBreed = [
  "Holstein Friesian",
  "Amritmahal",
  "Deoni",
  "Hallikar",
  "Khillar",
  "Krishna Valley",
  "Malnad Gidda"
];
const List<String> kShedType = [
  "Loose Housing System",
  "Cattle Shed",
  "Shed for Calves",
  "Conventional Dairy Barn",
  "Cow Sheds",
  "Floor",
  "Walls",
  "Roof"
];
