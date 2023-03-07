import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Post from "./Post.js";
import User from "./User.js";

const { DataTypes } = Sequelize;

const Comment = db.define(
  "comments",
  {
    comment: {
      type: DataTypes.STRING,
    },
    postId: {
      type: DataTypes.INTEGER,
      references: {
        model: "Post",
        key: "id",
      },
    },
    commentedBy: {
      type: DataTypes.INTEGER,
      references: {
        model: "User",
        key: "id",
      },
    },
  },
  {
    freezeTableName: true,
  }
);

Comment.associate = function () {
  Comment.belongsTo(User, { foreignKey: "commentedBy" });
  Comment.belongsTo(Post, { foreignKey: "postId" });
};


(async () => {
  await db.sync();
  console.log("Comment table created!");

  // Call the association function here
  Comment.associate(db.models);
})();

export default Comment;
