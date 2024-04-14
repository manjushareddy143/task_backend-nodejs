const jwt = require('jsonwebtoken');
const { AuthenticationError } = require('apollo-server');
const { JWT_SECRET } = require('../config/env.json');

const authenticateToken = (authorizationHeader) => {
    if (!authorizationHeader) {
        throw new AuthenticationError('Authorization header is required');
    }

    const token = authorizationHeader.split('Bearer ')[1];
    console.log("token")
    console.log(token)
    if (!token) {
        throw new AuthenticationError('Invalid token format');
    }

    try {
        const decodedToken = jwt.verify(token, JWT_SECRET);
        return decodedToken;
    } catch (error) {
        console.error('Error verifying token:', error);
        throw new AuthenticationError('Invalid or expired token');
    }
};

module.exports = authenticateToken;
