module.exports = async function(req,res){
    sails.log.debug("show the post creation for now")
    sails.log.warn("show the post creation for now")
    sails.log.info("show the post creation for now")
    //await Post.destroy({})
    const userId = req.session.userId
    const allPosts = await Post.find({user: userId})
        .populate('user')
        .sort('createdAt DESC')
    //return res.send(allPosts)
    res.view('pages/post/home',{
        allPosts
    })
}