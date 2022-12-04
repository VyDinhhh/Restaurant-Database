import httpService from "./httpService";
const apiEndPoint = '/order'

export function getOrders() {
    return httpService.get(apiEndPoint);
}

export function getOrder(id) {
    return httpService.get(apiEndPoint + "/" + id);
}

export function createOrder(data) {
    return httpService.post(apiEndPoint, data);
}

export function addItem(orderId, item) {
    return httpService.post(apiEndPoint + '/item/' + orderId, item);
}