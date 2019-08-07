module.exports = async function(req,res) {
    //async and promises in js
    const postBody = req.body.postBody
    sails.log.info("create post object with text: " + postBody)
    //waterline creation syntax
    const record = await Post.create({text: postBody}).fetch()

    res.send(record)

}