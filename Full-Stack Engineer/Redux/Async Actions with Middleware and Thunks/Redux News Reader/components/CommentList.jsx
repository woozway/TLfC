import React from "react";
import Comment from "./Comment";

export default function CommentList({ comments }) {
  if (comments) {
    return (
      <ul className="comments-list">
        {comments.map((comment) => (
          <Comment key={comment.id} comment={comment} />
        ))}
      </ul>
    );
  }
  return null;
}
