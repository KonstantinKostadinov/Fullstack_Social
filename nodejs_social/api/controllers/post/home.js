module.exports = async function(req,res){
    sails.log.debug("show the post creation for now")
    sails.log.warn("show the post creation for now")
    sails.log.info("show the post creation for now")
    const allPosts = await Post.find()
    res.view('pages/post/home',{
        allPosts
    })
}