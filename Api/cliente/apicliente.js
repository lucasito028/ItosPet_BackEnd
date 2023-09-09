document.addEventListener("DOMContentLoaded", function () {

    const createBtn = document.getElementById("createBtn");
    const updateBtn = document.getElementById("updateBtn");
    const deleteBtn = document.getElementById("deleteBtn");

    createBtn.addEventListener("click", function () {
        sendRequest("create");
    });

    updateBtn.addEventListener("click", function () {
        sendRequest("update");
    });

    deleteBtn.addEventListener("click", function () {
        sendRequest("delete");
    });

    function sendRequest(action) {
        const xhr = new XMLHttpRequest();
        const url = "crud_cliente.php"; // Substitua pelo caminho correto para o arquivo PHP que irá manipular a solicitação

        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const response = xhr.responseText;
                    alert(response); // Exiba a resposta do servidor (mensagem de sucesso ou falha)
                } else {
                    alert("Erro na solicitação ao servidor");
                }
            }
        };

        const data = "action=" + encodeURIComponent(action); // Envie a ação para o servidor
        xhr.send(data);
    }
});
