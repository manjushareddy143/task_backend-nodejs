Before running  application, make sure your MySQL database is set up correctly
npx sequelize-cli db:migrate
npm run dev
With your server running, open a web browser and go to:
http://localhost:4000/graphql

GrapQl-
query login{
  login(email: "bebo@gmail.com",password:"123456"){
    username
    token
  }
}
query getAllTask{
  getAllTask {
    taskname
    taskdescription
    priority
    duedate
  }
}

mutation register{
  register(username: "bebo", email: "bebo@gmail.com", password: "123456", confirmPassword: "12345") {
    username
  }
}
mutation createtask{
  createtask(taskname: "Create Custometre", taskdescription: "bsxxs", priority: "high", duedate: "30/09/1984") {
 taskname
 taskdescription
 priority
 duedate
  }
}

   mutation UpdateTask  {
  updatetask(
    id: 3,   
    taskname:" $taskname",
    taskdescription: "$taskdescription",
    priority: "$priority",
    duedate: "$duedate"
  ) {
     
    taskname
    taskdescription
    priority
    duedate
  }
}
   mutation deleteTask {
deleteTask(id: 2
) {
  taskdescription
} 
 
}
   }


Authorization:Bearer  token
