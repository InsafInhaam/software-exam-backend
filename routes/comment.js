import express from "express";
import { createComment, getComment } from "../controllers/commect.js";
import {
    authenticateToken,
} from "../middleware/requireLogin.js";

const router = express.Router();

router.post("/createComment", authenticateToken,createComment);
router.get("/comment/:id", authenticateToken, getComment);

export default router;