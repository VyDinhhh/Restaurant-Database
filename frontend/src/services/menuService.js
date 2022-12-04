import httpService from "./httpService";
const apiEndPoint = '/menu'

export function getMenuItems() {
    return httpService.get(apiEndPoint);
}

export function getMenuItem(id) {
    return httpService.get(apiEndPoint + "/" + id);
}