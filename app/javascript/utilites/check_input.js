document.addEventListener('turbolinks:load', function () {
    var confirm = document.querySelector('#user_password_confirmation')

    if (confirm) {
        confirm.addEventListener('input', Validate)
    }
})

function Validate() {
    var password = document.getElementById("user_password").value;
    var confirmPassword = document.getElementById("user_password_confirmation").value;
    if (confirmPassword.length == 0) {
        this.classList.remove('bg-danger')
        this.classList.remove('bg-success')
        this.classList.add('bg-light')
        return;
    }

    if (password != confirmPassword) {
        this.classList.remove('bg-success')
        this.classList.add('bg-danger')
    } else {
        this.classList.remove('bg-danger')
        this.classList.add('bg-success')
    }
}