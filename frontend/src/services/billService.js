import httpService from "./httpService";
const apiEndPoint = '/bill'

export function createBill(info) {
    return httpService.post(apiEndPoint, info);
}