import httpService from "./httpService";
const apiEndPoint = '/employee'


export function getEmployee(id) {
    return httpService.get(apiEndPoint + "/" + id);
}