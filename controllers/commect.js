import Comment from "../models/Comment.js";
import User from '../models/User.js';

export const createComment = async (req, res) => {
  const { comment, postId } = req.body;
  if (!comment) {
    res.status(422).json({ error: "Please enter the comment" });
  }

  if (!postId) {
    res.status(422).json({ error: "The post Id is not available" });
  }

  console.log(comment);
  console.log(postId);

  try {
    const makecomment = await Comment.create({
      comment,
      commentedBy: req.user.id,
      postId

    });
    res
      .status(201)
      .json({ message: "The commented successfully", makecomment });
  } catch (error) {
    res.status(422).json({
      error: error,
    });
  }
};


export const getComment = async (req, res) => {
    const comments = await Comment.findAll({
        where: { postId: req.params.id },
        include: [{ model: User, attributes: ["id", "name", "email", "userType"] }],
    });
    
      try {
        res.status(201).json(comments);
      } catch (error) {
        res.status(422).json({
          error: error,
        });
      }
};