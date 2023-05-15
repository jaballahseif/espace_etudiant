//toastr oprions
toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-bottom-right",
    "preventDuplicates": true,
    "onclick": null,
    "showDuration": "100",
    "hideDuration": "500",
    "timeOut": "2500",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}

function toastrSuccess(msg) {
    toastr.success(msg);
}
function toastrError(msg) {
    toastr.error(msg);
}
function toastrWarning(msg) {
    toastr.warning(msg);
}
function toastrInfo(msg) {
    toastr.info(msg);
}