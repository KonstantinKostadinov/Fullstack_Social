module.exports = async function(req,res){
    console.log("Listing out all users now...")
    //fetch all users usin Waterline
    const users = await User.find() //async task
    //silly solution
    // const  objs = []
    // users.forEach(user => {
    //     objs.push({id: user.id, fullName: user.fullName, email: user.emailAddress})
    // })
    res.send(users)
}