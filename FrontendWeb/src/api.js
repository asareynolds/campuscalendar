import axios from 'axios';

const API_BASE_URL = 'https://api.campuscal.tech';

export const listEvents = async (userUuid, tailored = false) => {
    try {
        console.log(`Fetching events for user ${userUuid}, tailored: ${tailored}`);
        const response = await axios.get(`${API_BASE_URL}/events`, {
            params: {
                user_uuid: userUuid,
                //taylored: tailored,
            },
        });
        console.log('API response:', response.data);
        return response.data;
    } catch (error) {
        console.error('Error listing events:', error);
        throw error;
    }
};