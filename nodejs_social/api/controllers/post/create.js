module.exports = async function(req,res) {
    //async and promises in js
    const postBody = req.body.postBody
    sails.log.info("create post object with text: " + postBody)
    //waterline creation syntax
    //prob userId user?
    const userId = req.session.userId
     await Post.create({text: postBody,user: userId}).fetch()

    res.redirect('/post')

}