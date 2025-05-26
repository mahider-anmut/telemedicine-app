let ioInstance;

function initSocket(server) {
  const { Server } = require("socket.io");
  const io = new Server(server, {
    cors: {
      origin: '*',
      methods: ['GET', 'POST'],
    },
  });

  console.log("WebSocket server initialized");
  
  ioInstance = io;

  io.on("connection", (socket) => {
    console.log("User connected:", socket.id);

    socket.on("join-room", (roomId) => {
      socket.join(roomId);
      console.log(`User ${socket.id} joined room ${roomId}`);
    });

    socket.on("send-message", (data) => {
      const { roomId, message } = data;
      console.log(`Message to room ${roomId}:`, message);
      socket.to(roomId).emit("receive-message", message);
    });

    socket.on("seen-message", (data) => {
      const { roomId, userId } = data;
      socket.to(roomId).emit("message-seen", { roomId, userId });
    });

    socket.on("disconnect", () => {
      console.log("User disconnected:", socket.id);
    });
  });

  return io;
}

function getIO() {
  if (!ioInstance) {
    throw new Error("Socket.io not initialized");
  }
  return ioInstance;
}

module.exports = { initSocket, getIO };