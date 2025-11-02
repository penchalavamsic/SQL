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
