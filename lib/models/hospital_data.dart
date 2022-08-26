import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih22/models/hospital.dart';

/*

Type:  1 -> "Ayurveda", 2 -> "Yoga", 3-> "Homeopathy", 4-> "Unani", 5->"Siddha"

Public: 1 -> yes, 2 -> no

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
    id: 1,
    type: 1,
    state: 13,
    totalBeds: 180,
    ipd: 59,
    opd: 68,
    currBeds: 56,
    phone: "07004700502",
    name: "Kottakal Arya Vaidya Sala",
    address:
        "Kottakkal Arya Vaidya Sala, Ernakulam Branch Clinic and Pharmacy, M.G Road, Ernakulam - 682016.",
    public: 1,
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
        name: "NAVARAKIZHI",
        desc:
            "It is a type of massage that induces sweat and provides strength to the muscles while rejuvenating and re-energizing your body. This procedure uses Shashtika Shali (a special type of rice harvested in 60 days and exclusively used for Ayurveda treatments), which is processed in herbal decoctions and milk",
        doctor: "Dr. Ramachandran K",
        email: "ramchandran.oansdy@gmail.com",
        phone: "8498373878",
      ),
      SpecializationModel(
        name: "THARPANAM",
        desc:
            "Netra Tharpanam is a rejuvenating ayurvedic treatment for our eyes. For strengthening the optical nerves, prevent cataract and provide a cooling effect to the eyes, pure and medicated ghee is applied on the eyes. This strengthens eye muscles, reduces burning sensations in eyes and relieves dry eye syndromes.",
        doctor: "Dr. Balachandran K",
        email: "gdyufdysjxh@gmail.com",
        phone: "89392847878",
      ),
      SpecializationModel(
        name: "SIROVASTI",
        desc:
            "Sirovasthi is an ancient ayurvedic treatment that involves warm herbal oils being placed on the head for a specific period of time. The oil is held in place using a bandage tied around the patient's head and an open-headed cap. Warm medicated oil poured into this cap and is allowed to soak into the scalp.",
        doctor: "Dr. Shrinivasa Pandey",
        email: "shrivabsh.oansdy@gmail.com",
        phone: "67837638798",
      ),
      SpecializationModel(
        name: "NASYAM",
        desc:
            "Nasya therapy is an Ayurvedic process that can help clean the upper respiratory passage by draining out the excessive mucus.",
        doctor: "Dr. Ramachandran K",
        email: "ramchandran.oansdy@gmail.com",
        phone: "8498373878",
      ),
      SpecializationModel(
        name: "THARPANAM",
        desc:
            "Nasya therapy is an Ayurvedic process that can help clean the upper respiratory passage by draining out the excessive mucus.",
        doctor: "Dr. Balachandran K",
        email: "gdyufdysjxh@gmail.com",
        phone: "89392847878",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "Dhara",
        desc:
            "It symbolizes the facilitation of the free flow of information on research in Ayurveda",
        photo:
            "https://www.keralatourism.org/images/ayurveda/static-banner/large/Dhara-18022020060624.jpg",
      ),
      FacilitiesModel(
        name: "",
        desc:
            "Podi or churnam is a powdered mix of ten to fifteen herbs. It is heated in a pan, usually with a small amount of oil. The herbs and their proportions in Podi depend on the illness and its severity. A linen cloth is filled with this Podi to make a Kizhi.\n It is then dipped in herbal oil and applied to the disease-affected areas of the patient.",
        photo:
            "https://www.keralatourism.org/images/ayurveda/static-banner/large/Podikkizhi-18022020062018.jpg",
      ),
      FacilitiesModel(
        name: "Sarvangadhara ",
        desc:
            "Sarvangadhara warm medicated oil is systematically massaged on all parts of the body as the patient lies on a Droni (Ayurvedic therapy table). Ideally, five attendants are required for performing the therapy. Using kindis, or brass spouted pitchers, four practitioners simultaneously pour the oil, and massage the patient from head to toe. One attendant regularly replenishes the oil.",
        photo:
            "https://www.keralatourism.org/images/ayurveda/static-banner/large/Sarvangadhara-18022020062101.jpg",
      ),
    ],
  ),

  // hospital2
  HospitalModel(
    id: 2,
    type: 1,
    state: 13,
    totalBeds: 200,
    ipd: 60,
    opd: 300,
    phone: "+91 9847 841 763 ",
    currBeds: 0,
    name: "PVA Ayurvedic Multi-speciality Hospital",
    address: "PVA Ayurvedic Hospital, Kattampally, Kannur, Kerala",
    public: 1,
    openHours: "9AM - 8PM",
    latLng: const LatLng(11.931873235193645, 75.37610304105816),
    photos: [
      "http://ayurvedaacharya.com/wp-content/uploads/2020/08/PVA-AYURVEDA.jpg",
      "http://ayurvedaacharya.com/wp-content/uploads/2020/08/With-Italian-Students.jpg"
    ],
    specs: [
      SpecializationModel(
        name: "Navara Kizhi ",
        desc: "Bolous Massage with medicated rice",
        doctor: "Dr. Abdul Rahman Poilan",
        email: "rokojbdhbhsdiu@ygyu.com",
        phone: "6876698988908",
      ),
      SpecializationModel(
        name: "Pizhichil or Oil Bath",
        desc:
            "An oil bath is a type of heated bath used in a laboratory, most commonly used to heat up chemical reactions. It's essentially a container of oil that is heated by a hot plate or (in rare cases) a Bunsen burner.",
        doctor: "Dr. Abdul Rahman Poilan",
        email: "rokojbdhbhsdiu@ygyu.com",
        phone: "6876698988908",
      ),
      SpecializationModel(
        name: "Thakra Dhara",
        desc:
            "Thakradhara is an Ayurvedic therapy, where medicated buttermilk is used (rather oil) for the treatment of diabetes, psoriasis, anorexia, ear-eye disorders",
        doctor: "Dr. Abdul Poilan",
        email: "rokojbdhbhsdiu@ygyu.com",
        phone: "6876698988908",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "Foot Massage ",
        desc:
            "Thakradhara is an Ayurvedic therapy, where medicated buttermilk is used (rather oil) for the treatment of diabetes, psoriasis, anorexia, ear-eye disorders",
        photo:
            "https://udaipurtimes.com/static/c1e/client/74416/migrated/0950423663260ee65413bb7dfc39cb2c.jpg",
      ),
      FacilitiesModel(
        name: "Head massage",
        desc: "",
        photo: "",
      ),
      FacilitiesModel(
        name: "PanchKarma",
        desc:
            "Panchakarma is a method of cleansing the body of all the unwanted waste after lubricating it. Panchakarma are 5 (five) in number; hence the term PANCHA (five) – KARMA (procedures). Panchakarma treatment is unique in the sense that it includes preventive, curative and promotive actions for various diseases.",
        photo:
            "https://3.imimg.com/data3/GM/WC/MY-11743077/images-panchkarma-500x500.jpg",
      ),
    ],
  ),

  // hospital3
  HospitalModel(
    id: 3,
    type: 1,
    state: 13,
    totalBeds: 80,
    ipd: 0,
    opd: 0,
    currBeds: 0,
    name: "Vaidyaratnam Oushadhasala (P) Ltd",
    address:
        "Vaidyaratnam Oushadhasala (P) Ltd, Ollur, Thaikkattussery, Thrissur, Kerala - 680 306",
    public: 1,
    openHours: "9AM - 8:30PM",
    latLng: const LatLng(10.007805877753285, 76.30630068186221),
    photos: [
      "https://images.jdmagicbox.com/comp/kannur/c7/9999px497.x497.170911170446.s1c7/catalogue/dhanwanthari-ayurveda-hospital-kannur-ayurvedic-doctors-for-orthopedic-1n1s4ij.jpg",
      "https://content3.jdmagicbox.com/comp/malappuram/l1/9999px483.x483.120618125223.i3l1/catalogue/vaidyaratnam-oushadhasala-pvt-ltd-malappuram-04z77tebtk.jpg?clr=333333",
      "https://lh3.googleusercontent.com/p/AF1QipPjzXp5oF8MIkqhoS_YH0heS-0NOPtU5f1tumL-=w768-h768-n-o-v1"
    ],
    specs: [
      SpecializationModel(
        name: "Cervical Spondylosis",
        desc:
            "Cervical spondylosis is the degeneration of the bones and disks in the neck. This condition can lead to a variety of problems, including herniated disks and bone spurs. As people age, the structures that make up the backbone and neck gradually develop wear and tear. These changes can include: Dehydrated disks.",
        doctor: "Dr. M. Kesavan M.S.A.M",
        email: "kseavaana@gmail.com",
        phone: "765787899",
      ),
      SpecializationModel(
        name: "Rheumatoid arthritis",
        desc:
            "Rheumatoid arthritis, or RA, is an autoimmune and inflammatory disease, which means that your immune system attacks healthy cells in your body by mistake, causing inflammation (painful swelling) in the affected parts of the body. RA mainly attacks the joints, usually many joints at once.",
        doctor: "Dr. Sr. Austin, MD",
        email: "austin@gmail.com",
        phone: "78687987987",
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
        name: "Modern diagnostic and clinical",
        desc:
            " Operation Theatres, modern bio-chemic laboratory, an X-ray unit, ECG and Ultra sound scan Unit.",
        photo:
            "https://calendula.hu/wp-content/uploads/2019/06/diagnostic-1000x658.jpg",
      ),
      FacilitiesModel(
        name: "Panchakarma",
        desc:
            "theatre for male and female, Yoga ward, physiotherapy rehabilitation unit is also attached",
        photo:
            "https://www.kratinwellness.com/wp-content/uploads/2014/11/pindasveda.jpg",
      ),
      FacilitiesModel(
        name: "Ksharasuthra treatment",
        desc:
            "Ante natal clinic, infertility clinic, ENT and Eye diseases clinic, visha treatment, skin clinic, paediatric treatment",
        photo:
            "https://chandigarhmetro.com/wp-content/uploads/2017/05/ayurvedic-massage.jpg",
      ),
    ],
  ),
  HospitalModel(
    id: 4,
    type: 5,
    state: 26,
    totalBeds: 10,
    ipd: 3,
    opd: 15,
    currBeds: 0,
    name: "Gov Siddhan Medical College",
    address:
        "Government Siddha Medical college, Nadu, Palayamkottai, Tirunelveli, 627002",
    public: 2,
    openHours: "9AM - 6:30PM",
    latLng: const LatLng(13.0788805550996, 80.2184108601037),
    photos: [
      "https://content.jdmagicbox.com/comp/kannur/q5/9999px497.x497.210805061010.p5q5/catalogue/kesavatheeram-ayurveda-hospital-ezhilode-kannur-ayurvedic-doctors-j4jpt943t4.jpg",
      "https://gsmcchennai.ac.in/assets/slider/55229533.jpg",
      "https://mymathews.com/media/gallery/Government_Siddha_Medical_College__4.JPG"
    ],
    specs: [
      SpecializationModel(
        name: "EYE DISEASES	",
        desc:
            "The leading causes of blindness and low vision in the United States are primarily age-related eye diseases such as age-related macular degeneration, cataract, diabetic retinopathy, and glaucoma. Other common eye disorders include amblyopia and strabismus.",
        doctor: "Dr. M. Kesavan M.S.A.M",
        email: "yudgeuigdb@gmail.com",
        phone: "8768768787",
      ),
      SpecializationModel(
        name: "JOINT DISEASES	",
        desc:
            "Joint diseases and low vision in the United States are primarily age-related eye diseases such as age-related macular degeneration, cataract, diabetic retinopathy, and glaucoma. Other common eye disorders include amblyopia and strabismus.",
        doctor: "Dr. M.S.A.M",
        email: "yugdygdhvb@gmail.com",
        phone: "76789787798",
      ),
      SpecializationModel(
        name: "MENTAL ILLNESS	",
        desc:
            "Menatal inllness range of mental health conditions — disorders that affect your mood, thinking and behavior. Examples of mental illness include depression, anxiety disorders, schizophrenia, eating disorders and addictive behaviors",
        doctor: "Dr. M.S.A.M",
        email: "yugdygdhvb@gmail.com",
        phone: "76789787798",
      ),
      SpecializationModel(
        name: "WOMENS H",
        desc:
            "H-Women's purpose is to enable historians more easily to discuss research interests, teaching methods, and the state of the field and historiography ",
        doctor: "Dr. M.S.A.M",
        email: "yugdygdhvb@gmail.com",
        phone: "76789787798",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "NCD OPD",
        desc:
            "provides screening and management of lifestyle disorders such as Diabetes, Hypertension, Obesity, Cancer, Chronic respiratory diseases",
        photo:
            "https://i0.wp.com/beingthedoctor.com/wp-content/uploads/2015/11/DSC00719-e1563186294632.jpg?fit=720%2C540&ssl=1",
      ),
      FacilitiesModel(
        name: "Geriatric OPD ",
        desc:
            " manages Old age ailments through Siddha medicines and dietary counselling.",
        photo:
            "https://images.hindustantimes.com/img/2022/03/22/550x309/2d6050a8-aa27-11ec-9297-ed70bb26c8ff_1647984710423.jpg",
      ),
      FacilitiesModel(
        name: "RCH OPD",
        desc:
            "treats gynaecological and children diseases through Siddha treatment.",
        photo:
            "https://ypsmhomoeocollege.in/wp-content/uploads/2021/08/opd-1024x419.jpg",
      ),
    ],
  ),
  HospitalModel(
    id: 5,
    type: 1,
    state: 13,
    totalBeds: 90,
    ipd: 7,
    opd: 19,
    currBeds: 0,
    name: "Amala Ayurvedic Hospital And Research Center",
    address: "Amalanagar, Thrissur, Kerala 680555",
    public: 1,
    openHours: "9AM - 6:30PM",
    latLng: const LatLng(10.5626885389207, 76.16550805269523),
    photos: [
      "https://www.tyndisheritage.com/uploads/editor/mceu_68647435281658935914063-1658935914.jpg",
      "https://content3.jdmagicbox.com/comp/thrissur/b5/9999px487.x487.171231195203.r1b5/catalogue/amala-ayurvedic-hospital-and-research-center-amalanagar-thrissur-ayurvedic-doctors-8yc5rb553x.jpg?clr=465214",
      " https://content3.jdmagicbox.com/comp/thrissur/b5/9999px487.x487.171231195203.r1b5/catalogue/amala-ayurvedic-hospital-and-research-center-amalanagar-thrissur-ayurvedic-doctors-irpsc5uqdg-250.jpg"
    ],
    specs: [
      SpecializationModel(
        name: "Cervical Spondylosis",
        desc:
            "Cervical spondylosis is the degeneration of the bones and disks in the neck. This condition can lead to a variety of problems, including herniated disks and bone spurs. As people age, the structures that make up the backbone and neck gradually develop wear and tear. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
      SpecializationModel(
        name: "Osteo arthritis",
        desc:
            "A type of arthritis that occurs when flexible tissue at the ends of bones wears down.\nThe wearing down of the protective tissue at the ends of bones (cartilage) occurs gradually and worsens over time.\n Joint pain in the hands, neck, lower back, knees or hips is the most common symptom. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
      SpecializationModel(
        name: "Lumbar spondylosis",
        desc:
            "Spondylosis is common and worsens with age. This condition is often used to describe degenerative arthritis (osteoarthritis) of the spine.\nMost people don't have symptoms, but some may experience pain or muscle spasms.In many cases, no specific treatment is required. If symptoms occur, treatments include medication, corticosteroid injections, physiotherapy and sometimes surgery.",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "NCD OPD",
        desc:
            "provides screening and management of lifestyle disorders such as Diabetes, Hypertension, Obesity, Cancer, Chronic respiratory diseases",
        photo:
            "https://i0.wp.com/beingthedoctor.com/wp-content/uploads/2015/11/DSC00719-e1563186294632.jpg?fit=720%2C540&ssl=1",
      ),
      FacilitiesModel(
        name: "Geriatric OPD ",
        desc:
            " manages Old age ailments through Siddha medicines and dietary counselling.",
        photo:
            "https://images.hindustantimes.com/img/2022/03/22/550x309/2d6050a8-aa27-11ec-9297-ed70bb26c8ff_1647984710423.jpg",
      ),
      FacilitiesModel(
        name: "RCH OPD",
        desc:
            "treats gynaecological and children diseases through Siddha treatment.",
        photo:
            "https://ypsmhomoeocollege.in/wp-content/uploads/2021/08/opd-1024x419.jpg",
      ),
    ],
  ),
  HospitalModel(
    id: 6,
    type: 1,
    state: 13,
    totalBeds: 90,
    ipd: 7,
    opd: 19,
    currBeds: 0,
    name: "Ananthapuri Hospitals and Research Institute",
    address: "Chacka, NH Bypass, Thiruvananthapuram - 695024, Kerala",
    public: 1,
    openHours: "12:00 AM - 12:00 PM",
    latLng: const LatLng(9.486613943875998, 76.92703365453217),
    photos: [
      "https://www.ananthapurihospitals.com/assets/front/images/img_general.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiJV_6dZYnUGKqBv7uc-Crz_MFRFJdp9saHQ&usqp=CAU"
    ],
    specs: [
      SpecializationModel(
        name: "Abhyangam, Nasyam",
        desc:
            "Cervical spondylosis is the degeneration of the bones and disks in the neck. This condition can lead to a variety of problems, including herniated disks and bone spurs. As people age, the structures that make up the backbone and neck gradually develop wear and tear. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
      SpecializationModel(
        name: "Elakizhi",
        desc:
            "A type of arthritis that occurs when flexible tissue at the ends of bones wears down.\nThe wearing down of the protective tissue at the ends of bones (cartilage) occurs gradually and worsens over time.\n Joint pain in the hands, neck, lower back, knees or hips is the most common symptom. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
      SpecializationModel(
        name: "Udwartanam",
        desc:
            "Spondylosis is common and worsens with age. This condition is often used to describe degenerative arthritis (osteoarthritis) of the spine.\nMost people don't have symptoms, but some may experience pain or muscle spasms.In many cases, no specific treatment is required. If symptoms occur, treatments include medication, corticosteroid injections, physiotherapy and sometimes surgery.",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "Sirovasthy",
        desc:
            "provides screening and management of lifestyle disorders such as Diabetes, Hypertension, Obesity, Cancer, Chronic respiratory diseases",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbC2SpkcLnDBjfUzIVHP7UmqRZClXkVKfUGA&usqp=CAU",
      ),
      FacilitiesModel(
        name: "Njavarakizhi",
        desc:
            " manages Old age ailments through Siddha medicines and dietary counselling.",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIFU4FKdPyegOZaGbj9saxwk183FhFrJfc_w&usqp=CAU",
      ),
      FacilitiesModel(
        name: "Elakizhi",
        desc:
            "treats gynaecological and children diseases through Siddha treatment.",
        photo:
            "https://ypsmhomoeocollege.in/wp-content/uploads/2021/08/opd-1024x419.jpg",
      ),
    ],
  ),
  HospitalModel(
    id: 7,
    type: 1,
    state: 17,
    totalBeds: 90,
    ipd: 7,
    opd: 19,
    currBeds: 0,
    name: "AAVN Arogya Ayurvedic Hospital",
    address:
        "B 108 Janak Deep, Seven Bunglow, Andheri West, Mumbai, Maharashtra 400061",
    public: 1,
    openHours: "09:00 AM - 08:30 PM",
    latLng: const LatLng(9.9002007454962, 78.07087805269146),
    photos: [
      "https://www.tyndisheritage.com/uploads/editor/mceu_68647435281658935914063-1658935914.jpg",
      "https://avnarogya.in/uploads/2018/06/17-Royal-Villa.jpg",
      'https://avnarogya.in/uploads/2018/06/7.jpg'
    ],
    specs: [
      SpecializationModel(
        name: "Abhyangam, Nasyam",
        desc:
            "Cervical spondylosis is the degeneration of the bones and disks in the neck. This condition can lead to a variety of problems, including herniated disks and bone spurs. As people age, the structures that make up the backbone and neck gradually develop wear and tear. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "9500292220",
      ),
      SpecializationModel(
        name: "Elakizhi",
        desc:
            "A type of arthritis that occurs when flexible tissue at the ends of bones wears down.\nThe wearing down of the protective tissue at the ends of bones (cartilage) occurs gradually and worsens over time.\n Joint pain in the hands, neck, lower back, knees or hips is the most common symptom. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
      SpecializationModel(
        name: "Udwartanam",
        desc:
            "Spondylosis is common and worsens with age. This condition is often used to describe degenerative arthritis (osteoarthritis) of the spine.\nMost people don't have symptoms, but some may experience pain or muscle spasms.In many cases, no specific treatment is required. If symptoms occur, treatments include medication, corticosteroid injections, physiotherapy and sometimes surgery.",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "Sirovasthy",
        desc:
            "provides screening and management of lifestyle disorders such as Diabetes, Hypertension, Obesity, Cancer, Chronic respiratory diseases",
        photo:
            "https://avnarogya.in/uploads/2018/06/clinic%20chennai%281%29.jpg",
      ),
      FacilitiesModel(
        name: "Njavarakizhi",
        desc:
            " manages Old age ailments through Siddha medicines and dietary counselling.",
        photo: "https://avnarogya.in/uploads/2018/06/Copy-of-Sirodhara.JPG",
      ),
      FacilitiesModel(
        name: "Elakizhi",
        desc:
            "treats gynaecological and children diseases through Siddha treatment.",
        photo:
            "https://avnarogya.in/uploads/2018/06/clinic%20malaysia%281%29.jpg",
      ),
    ],
  ),

  HospitalModel(
    id: 8,
    type: 1,
    state: 07,
    totalBeds: 90,
    ipd: 7,
    opd: 19,
    currBeds: 0,
    name: "Majeedia Unani Hospital",
    address: "Block D, Hamdard Nagar, New Delhi, Delhi 110062",
    public: 1,
    openHours: "09:00 AM - 03:30 PM",
    latLng: const LatLng(28.513965694111924, 77.25184073760683),
    photos: [""],
    specs: [
      SpecializationModel(
        name: "Abhyangam, Nasyam",
        desc:
            "Cervical spondylosis is the degeneration of the bones and disks in the neck. This condition can lead to a variety of problems, including herniated disks and bone spurs. As people age, the structures that make up the backbone and neck gradually develop wear and tear. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "9500292220",
      ),
      SpecializationModel(
        name: "Elakizhi",
        desc:
            "A type of arthritis that occurs when flexible tissue at the ends of bones wears down.\nThe wearing down of the protective tissue at the ends of bones (cartilage) occurs gradually and worsens over time.\n Joint pain in the hands, neck, lower back, knees or hips is the most common symptom. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
      SpecializationModel(
        name: "Udwartanam",
        desc:
            "Spondylosis is common and worsens with age. This condition is often used to describe degenerative arthritis (osteoarthritis) of the spine.\nMost people don't have symptoms, but some may experience pain or muscle spasms.In many cases, no specific treatment is required. If symptoms occur, treatments include medication, corticosteroid injections, physiotherapy and sometimes surgery.",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "Sirovasthy",
        desc:
            "provides screening and management of lifestyle disorders such as Diabetes, Hypertension, Obesity, Cancer, Chronic respiratory diseases",
        photo:
            "https://avnarogya.in/uploads/2018/06/clinic%20chennai%281%29.jpg",
      ),
      FacilitiesModel(
        name: "Njavarakizhi",
        desc:
            " manages Old age ailments through Siddha medicines and dietary counselling.",
        photo: "https://avnarogya.in/uploads/2018/06/Copy-of-Sirodhara.JPG",
      ),
      FacilitiesModel(
        name: "Elakizhi",
        desc:
            "treats gynaecological and children diseases through Siddha treatment.",
        photo:
            "https://avnarogya.in/uploads/2018/06/clinic%20malaysia%281%29.jpg",
      ),
    ],
  ),

  HospitalModel(
    id: 9,
    type: 3,
    state: 07,
    totalBeds: 90,
    ipd: 7,
    opd: 19,
    currBeds: 0,
    name: "Nehru Homoeopathic Medical College and Hospital",
    address: "Block D, Hamdard Nagar, New Delhi, Delhi 110062",
    public: 1,
    openHours: "09:00 AM - 03:30 PM",
    latLng: const LatLng(28.571339950997764, 77.22862115294954),
    photos: [
      "https://content3.jdmagicbox.com/comp/jaipur/l8/0141px141.x141.140417192116.g2l8/catalogue/national-institute-of-ayurveda-amer-road-jaipur-institutes-hgfcwsu5lz.jpg?clr=3f3f27",
      'https://avnarogya.in/uploads/2018/06/7.jpg'
    ],
    specs: [
      SpecializationModel(
        name: "Abhyangam, Nasyam",
        desc:
            "Cervical spondylosis is the degeneration of the bones and disks in the neck. This condition can lead to a variety of problems, including herniated disks and bone spurs. As people age, the structures that make up the backbone and neck gradually develop wear and tear. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "9500292220",
      ),
      SpecializationModel(
        name: "Elakizhi",
        desc:
            "A type of arthritis that occurs when flexible tissue at the ends of bones wears down.\nThe wearing down of the protective tissue at the ends of bones (cartilage) occurs gradually and worsens over time.\n Joint pain in the hands, neck, lower back, knees or hips is the most common symptom. ",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
      SpecializationModel(
        name: "Udwartanam",
        desc:
            "Spondylosis is common and worsens with age. This condition is often used to describe degenerative arthritis (osteoarthritis) of the spine.\nMost people don't have symptoms, but some may experience pain or muscle spasms.In many cases, no specific treatment is required. If symptoms occur, treatments include medication, corticosteroid injections, physiotherapy and sometimes surgery.",
        doctor: "Dr Yiogesgg uihuigiy",
        email: "wddduygyg@gmail.com",
        phone: "78289672576",
      ),
    ],
    facilities: [
      FacilitiesModel(
        name: "Sirovasthy",
        desc:
            "provides screening and management of lifestyle disorders such as Diabetes, Hypertension, Obesity, Cancer, Chronic respiratory diseases",
        photo:
            "https://avnarogya.in/uploads/2018/06/clinic%20chennai%281%29.jpg",
      ),
      FacilitiesModel(
        name: "Njavarakizhi",
        desc:
            " manages Old age ailments through Siddha medicines and dietary counselling.",
        photo: "https://avnarogya.in/uploads/2018/06/Copy-of-Sirodhara.JPG",
      ),
      FacilitiesModel(
        name: "Elakizhi",
        desc:
            "treats gynaecological and children diseases through Siddha treatment.",
        photo:
            "https://avnarogya.in/uploads/2018/06/clinic%20malaysia%281%29.jpg",
      ),
    ],
  ),
];
