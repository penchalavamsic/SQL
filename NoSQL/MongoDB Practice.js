use cdac_practice
switched to db cdac_practice
show databases
admin           40.00 KiB
cdac_practice    8.00 KiB
config          60.00 KiB
local          324.00 KiB
use cdac_practice
already on db cdac_practice
show collections
cdac
db.cdac.insertOne({name:'vamsi',course:'DAC',year:2025})
{
  acknowledged: true,
  insertedId: ObjectId('690705e2eacb24b749a1a78e')
}
db.cdac.find()
{
  _id: ObjectId('690705e2eacb24b749a1a78e'),
  name: 'vamsi',
  course: 'DAC',
  year: 2025
}
//insert many
db.cdac.insertMany([{ name: "Rahul", age: 20, course: "Chemistry", marks: 76 },
  { name: "Sara", age: 23, course: "Biology", marks: 82 },
  { name: "Neha", age: 21, course: "Math", marks: 95 },
]);
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('690709f4eacb24b749a1a78f'),
    '1': ObjectId('690709f4eacb24b749a1a790'),
    '2': ObjectId('690709f4eacb24b749a1a791')
  }
}
//insert with nested object
db.cdac.insertOne({name:'sai',})
{
  acknowledged: true,
  insertedId: ObjectId('69070a3ceacb24b749a1a792')
}
db.cdac.insertOne({name:'lokesh',course:'DESD',year:2017,address:{city:'pune',state:'Maharastra'}})


//insert with array
db.cdac.insertOne({name:'Bhavya',course:'VLSI',year:2017,skill:['Verilog','Micro-Controllers']});

//find with operators
db.cdac.find({marks:{$gt:85}});
{
  _id: ObjectId('690709f4eacb24b749a1a791'),
  name: 'Neha',
  age: 21,
  course: 'Math',
  marks: 95
}
{
  _id: ObjectId('6907446a21cb800fc61bbae3'),
  name: 'Vamsi',
  age: 22,
  course: 'Math',
  marks: 92,
  skills: [
    'Python',
    'MongoDB',
    'React'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae4'),
  name: 'Rahul',
  age: 21,
  course: 'Physics',
  marks: 88,
  skills: [
    'Python',
    'MongoDB',
    'NodeJS'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae6'),
  name: 'Kiran',
  age: 24,
  course: 'Math',
  marks: 95,
  skills: [
    'Python',
    'MongoDB',
    'Django'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae8'),
  name: 'Rohit',
  age: 20,
  course: 'Physics',
  marks: 86,
  skills: [
    'Python',
    'MongoDB'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae9'),
  name: 'Sara',
  age: 21,
  course: 'English',
  marks: 90,
  skills: [
    'Python',
    'Data Analysis'
  ]
}
db.cdac.find({age:{$gte:21,$lte:23}});
{
  _id: ObjectId('690709f4eacb24b749a1a790'),
  name: 'Sara',
  age: 23,
  course: 'Biology',
  marks: 82
}
{
  _id: ObjectId('690709f4eacb24b749a1a791'),
  name: 'Neha',
  age: 21,
  course: 'Math',
  marks: 95
}
{
  _id: ObjectId('6907446a21cb800fc61bbae3'),
  name: 'Vamsi',
  age: 22,
  course: 'Math',
  marks: 92,
  skills: [
    'Python',
    'MongoDB',
    'React'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae4'),
  name: 'Rahul',
  age: 21,
  course: 'Physics',
  marks: 88,
  skills: [
    'Python',
    'MongoDB',
    'NodeJS'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae5'),
  name: 'Anu',
  age: 23,
  course: 'Chemistry',
  marks: 79,
  skills: [
    'Java',
    'SQL'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae7'),
  name: 'Meena',
  age: 22,
  course: 'Biology',
  marks: 82,
  skills: [
    'HTML',
    'CSS'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae9'),
  name: 'Sara',
  age: 21,
  course: 'English',
  marks: 90,
  skills: [
    'Python',
    'Data Analysis'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbaea'),
  name: 'Arjun',
  age: 23,
  course: 'Math',
  marks: 70,
  skills: [
    'Java',
    'MongoDB'
  ]
}
db.cdac.find({skills:{$in:['Java','Python']}});
{
  _id: ObjectId('6907446a21cb800fc61bbae3'),
  name: 'Vamsi',
  age: 22,
  course: 'Math',
  marks: 92,
  skills: [
    'Python',
    'MongoDB',
    'React'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae4'),
  name: 'Rahul',
  age: 21,
  course: 'Physics',
  marks: 88,
  skills: [
    'Python',
    'MongoDB',
    'NodeJS'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae5'),
  name: 'Anu',
  age: 23,
  course: 'Chemistry',
  marks: 79,
  skills: [
    'Java',
    'SQL'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae6'),
  name: 'Kiran',
  age: 24,
  course: 'Math',
  marks: 95,
  skills: [
    'Python',
    'MongoDB',
    'Django'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae8'),
  name: 'Rohit',
  age: 20,
  course: 'Physics',
  marks: 86,
  skills: [
    'Python',
    'MongoDB'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae9'),
  name: 'Sara',
  age: 21,
  course: 'English',
  marks: 90,
  skills: [
    'Python',
    'Data Analysis'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbaea'),
  name: 'Arjun',
  age: 23,
  course: 'Math',
  marks: 70,
  skills: [
    'Java',
    'MongoDB'
  ]
}
//update
db.cdac.updateOne({name:'Rahul'},{$set:{course:'DAC'}});
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}


//sorting
db.cdac.find().sort({marks:1});
{
  _id: ObjectId('690705e2eacb24b749a1a78e'),
  name: 'vamsi',
  course: 'DAC',
  year: 2025
}
{
  _id: ObjectId('69070a3ceacb24b749a1a792'),
  name: 'sai'
}
{
  _id: ObjectId('69070a8feacb24b749a1a793'),
  name: 'lokesh',
  course: 'DESD',
  year: 2017,
  address: {
    city: 'pune',
    state: 'Maharastra'
  }
}
{
  _id: ObjectId('69070be7eacb24b749a1a794'),
  name: 'Bhavya',
  course: 'VLSI',
  year: 2017,
  skill: [
    'Verilog',
    'Micro-Controllers'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbaea'),
  name: 'Arjun',
  age: 23,
  course: 'Math',
  marks: 70,
  skills: [
    'Java',
    'MongoDB'
  ]
}
{
  _id: ObjectId('690709f4eacb24b749a1a78f'),
  name: 'Rahul',
  age: 20,
  course: 'DAC',
  marks: 76
}
{
  _id: ObjectId('6907446a21cb800fc61bbae5'),
  name: 'Anu',
  age: 23,
  course: 'Chemistry',
  marks: 79,
  skills: [
    'Java',
    'SQL'
  ]
}
{
  _id: ObjectId('690709f4eacb24b749a1a790'),
  name: 'Sara',
  age: 23,
  course: 'Biology',
  marks: 82
}
{
  _id: ObjectId('6907446a21cb800fc61bbae7'),
  name: 'Meena',
  age: 22,
  course: 'Biology',
  marks: 82,
  skills: [
    'HTML',
    'CSS'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae8'),
  name: 'Rohit',
  age: 20,
  course: 'Physics',
  marks: 86,
  skills: [
    'Python',
    'MongoDB'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae4'),
  name: 'Rahul',
  age: 21,
  course: 'Physics',
  marks: 88,
  skills: [
    'Python',
    'MongoDB',
    'NodeJS'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae9'),
  name: 'Sara',
  age: 21,
  course: 'English',
  marks: 90,
  skills: [
    'Python',
    'Data Analysis'
  ]
}
{
  _id: ObjectId('6907446a21cb800fc61bbae3'),
  name: 'Vamsi',
  age: 22,
  course: 'Math',
  marks: 92,
  skills: [
    'Python',
    'MongoDB',
    'React'
  ]
}
{
  _id: ObjectId('690709f4eacb24b749a1a791'),
  name: 'Neha',
  age: 21,
  course: 'Math',
  marks: 95
}

