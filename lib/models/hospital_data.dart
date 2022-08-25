import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih22/models/hospital.dart';

/*

Type:  1 -> "Ayurveda", 2 -> "Yoga", 3-> "Homeopathy", 4-> "Unani", 5->"Siddha"

State: 
01 	Andaman & Nicobar Is. 	16 	Madhya Pradesh
02 	Andhra Pradesh        	17 	Maharashtra
03 	Arunachal Pradesh 	    18 	Manipur
04 	Assam                 	19 	Meghalaya
05 	Bihar 	                20 	Karnataka (Mysore)
06 	Chandigarh 	            21 	Nagaland
07 	Dadra & Nagar Haveli 	  22 	Orissa
08 	Delhi 	                23 	Pondicherry
09 	Goa, Daman & Diu 	      24 	Punjab
10 	Gujarat 	              25 	Rajasthan
11 	Haryana 	              26 	Tamil Nadu
12 	Himachal Pradesh 	      27 	Tripura
13 	Jammu & Kashmir 	      28 	Uttar Pradesh
14 	Kerala 	                29 	West Bengal
15 	Lakshadweep 	          30 	Sikkim
31 	Mizoram 

*/
List<HospitalModel> hospitals = [
  // hospital 1
  HospitalModel(
    id: 16,
    type: 1,
    state: 14,
    totalBeds: 180,
    ipd: 5,
    opd: 6,
    currBeds: 56,
    name: "Kottakal Arya Vaidya Sala",
    address:
        "Kottakkal Arya Vaidya Sala\nErnakulam Branch Clinic and Pharmac\nM.G Road, Ernakulam - 682016.",
    isPublic: true,
    openHours: "Open 24 Hours",
    latLng: const LatLng(10.046761677159127, 76.33444923640755),
    photos: [
      "https://www.aryavaidyasala.com/images/about_us_banner.jpg",
      "https://www.aryavaidyasala.com/images/kochi_hopsital_1.jpg",
      "https://www.aryavaidyasala.com/webadmin/uploads/o_1b233r1rd1rvs1oa21oehtce1qp7b.jpg",
      "https://www.aryavaidyasala.com/webadmin/uploads/o_1b233r1rd1bum1ajo7rqjhq10o9c.jpg"
    ],
    specs: [
      SpecializationModel(
        name: "DHARA",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "NAVARAKIZHI",
        desc:
            "It is a type of massage that induces sweat and provides strength to the muscles while rejuvenating and re-energizing your body. This procedure uses Shashtika Shali (a special type of rice harvested in 60 days and exclusively used for Ayurveda treatments), which is processed in herbal decoctions and milk",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "THARPANAM",
        desc:
            "Netra Tharpanam is a rejuvenating ayurvedic treatment for our eyes. For strengthening the optical nerves, prevent cataract and provide a cooling effect to the eyes, pure and medicated ghee is applied on the eyes. This strengthens eye muscles, reduces burning sensations in eyes and relieves dry eye syndromes.",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "PIZHICHIL",
        desc:
            "Pizhichil (literally meaning squeezing) is a unique Ayurvedic therapy from Kerala. In this treatment, a special linen cloth is dipped into warm Kuzhambu, or a medicated oil mixture, and squeezed over the disease-affected areas of the patient.",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "SIROVASTI",
        desc:
            "Sirovasthi is an ancient ayurvedic treatment that involves warm herbal oils being placed on the head for a specific period of time. The oil is held in place using a bandage tied around the patient's head and an open-headed cap. Warm medicated oil poured into this cap and is allowed to soak into the scalp.",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "NASYAM",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "THARPANAM",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
    ],
  ),

  // hospital2
  HospitalModel(
    id: 2,
    type: 1,
    state: 14,
    totalBeds: 200,
    ipd: 0,
    opd: 0,
    currBeds: 0,
    name: "PVA Ayurvedic Multi-speciality Hospital",
    address: "PVA Ayurvedic Hospital\nKattampally, Kannur, Kerala",
    isPublic: true,
    openHours: "9AM - 8PM",
    latLng: const LatLng(1, 1),
    photos: [
      "http://ayurvedaacharya.com/wp-content/uploads/2020/08/PVA-AYURVEDA.jpg",
      "",
      ""
    ],
    specs: [
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
    ],
  ),

  // hospital3
  HospitalModel(
    id: 3,
    type: 1,
    state: 14,
    totalBeds: 80,
    ipd: 0,
    opd: 0,
    currBeds: 0,
    name: "Vaidyaratnam Oushadhasala (P) Ltd",
    address:
        "Vaidyaratnam Oushadhasala (P) Ltd, Ollur, Thaikkattussery, Thrissur, Kerala - 680 306",
    isPublic: true,
    openHours: "9AM - 8:30PM",
    latLng: const LatLng(10.475981100375515, 76.24226691485008),
    photos: [
      "https://images.jdmagicbox.com/comp/kannur/c7/9999px497.x497.170911170446.s1c7/catalogue/dhanwanthari-ayurveda-hospital-kannur-ayurvedic-doctors-for-orthopedic-1n1s4ij.jpg",
      "",
      ""
    ],
    specs: [
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
    ],
  ),
  HospitalModel(
    id: 4,
    type: 2,
    state: 14,
    totalBeds: 100,
    ipd: 0,
    opd: 0,
    currBeds: 0,
    name: "Homeopathic Hospital 4",
    address:
        "Complete Address(P) Ltd, Ollur, Thaikkattussery, Thrissur, Kerala - 680 306",
    isPublic: true,
    openHours: "9AM - 6:30PM",
    latLng: const LatLng(10.475981100375515, 76.24226691485008),
    photos: [
      "https://content.jdmagicbox.com/comp/kannur/q5/9999px497.x497.210805061010.p5q5/catalogue/kesavatheeram-ayurveda-hospital-ezhilode-kannur-ayurvedic-doctors-j4jpt943t4.jpg",
      "",
      ""
    ],
    specs: [
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
    ],
  ),
  HospitalModel(
    id: 5,
    type: 2,
    state: 14,
    totalBeds: 100,
    ipd: 0,
    opd: 0,
    currBeds: 0,
    name: "Homeopathic Hospital 5",
    address:
        "Complete Address(P) Ltd, Ollur, Thaikkattussery, Thrissur, Kerala - 680 306",
    isPublic: true,
    openHours: "9AM - 6:30PM",
    latLng: const LatLng(10.475981100375515, 76.24226691485008),
    photos: [
      "https://www.tyndisheritage.com/uploads/editor/mceu_68647435281658935914063-1658935914.jpg",
      "",
      ""
    ],
    specs: [
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
      SpecializationModel(
        name: "",
        desc: "",
        doctor: "",
        email: "",
        phone: "",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "",
        desc: "",
        photo: "",
      ),
    ],
  ),
];
