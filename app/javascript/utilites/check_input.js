document.addEventListener('turbolinks:load', function () {
    var confirm = document.querySelector('#user_password_confirmation')

    if (confirm) {
        confirm.addEventListener('input', Validate)
    }
})

function Validate() {
    var password = document.getElementById("user_password").value;
    var confirmPassword = document.getElementById("user_password_confirmation").value;
    if (password != confirmPassword) {
        this.classList.add('bg-danger');
        return false;
    }
    if (password = confirmPassword) {
        this.classList.remove('bg-danger')
        this.classList.add('bg-success')
        return false;
    }
    return true;
}