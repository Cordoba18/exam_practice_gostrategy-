
//Obtener componentes de formulario
const select_regions = document.querySelector("select[name=select_regions]");
const select_communes = document.querySelector("select[name=select_communes]");
const dni = document.querySelector("input[name=dni]");
const email = document.querySelector("input[name=email]");
const name = document.querySelector("input[name=name]");
const lastname = document.querySelector("input[name=lastname]");
const address = document.querySelector("input[name=address]");
const date_reg = document.querySelector("input[name=date_reg]");
const btn_save = document.querySelector("#btn_save");
const alert_error = document.querySelector("#alert_error");
////////////////////




//obtener todas las regiones de la api
axios.get('/api/customers/get_regiones', {
    params: {
      token: token,
    }
  })
  .then(function (response) {

    const data = response.data.data;
    if (response.data.status == true) {

        select_regions.innerHTML= `<option value=''>Select a region</option>`;
        data.forEach(d => {

            select_regions.innerHTML+= `<option value='${d.id_reg}'>${d.description}</option>`;
        });


        activate_select_regions(select_regions);
    }else{
        const message = response.data.message;
        Swal.fire({
            title: "oppss! algo salio mal",
            text: message,
            icon: "error"
          });

          setTimeout(() => {
            window.location = "/login";
          }, 3000);


    }

  })
  .catch(function (error) {
   alert(error);

   setTimeout(() => {
    window.location = "/login";
  }, 3000);
  });



  //funcion para activar evento y cambiar comunas
  function activate_select_regions(select_regions) {



    select_regions.addEventListener("change", () => {

        if (select_regions.value != "" && select_regions.value !=null) {

        axios.get('/api/customers/get_communes', {
            params: {
              token: token,
              id_reg: select_regions.value,
            }
          })
          .then(function (response) {

            const data = response.data.data;


            if (response.data.status == true) {
                select_communes.innerHTML = "";

                data.forEach(d => {

                    select_communes.innerHTML+= `<option value='${d.id_com}'>${d.description}</option>`;
                });



            }else{
                const message = response.data.message;
                Swal.fire({
                    title: "oppss! algo salio mal",
                    text: message,
                    icon: "error"
                  });

                  setTimeout(() => {
                    window.location = "/login";
                  }, 3000);


            }

          })
          .catch(function (error) {
           alert(error);

           setTimeout(() => {
            window.location = "/login";
          }, 3000);
          });

        }
    })
  }

  //---save dates---------
//   const select_regions = document.querySelector("select[name=select_regions]");
//   const select_communes = document.querySelector("select[name=select_communes]");
//   const dni = document.querySelector("input[name=dni]");
//   const email = document.querySelector("input[name=email]");
//   const name = document.querySelector("input[name=name]");
//   const lastname = document.querySelector("input[name=lastname]");
//   const address = document.querySelector("input[name=address]");
//   const date_reg = document.querySelector("input[name=date_reg]");

btn_save.addEventListener("click", (e) => {

    e.preventDefault();


    axios.post('/api/customers/save', {
        dni: dni.value,
        id_com: select_communes.value,
        email: email.value,
        name: name.value,
        lastname: lastname.value,
        address: address.value,
        date_reg: date_reg.value,
        status: 1,
        token:token,
      })
      .then(function (response) {
        console.log(response);

        if (!response.data.status) {



            alert_error.removeAttribute("hidden");

            alert_error.innerHTML = response.data.message;
        }else{

            alert_error.setAttribute("hidden", "true");
            Swal.fire({
                title: "Nice!",
                text: response.data.message,
                icon: "success"
              });
               select_regions.value="";
               select_communes.value="";
               dni.value="";
               email.value="";
               name.value="";
               lastname.value="";
               address.value="";
               date_reg.value="";

        }
      })
      .catch(function (error) {
        console.log(error);
        alert(error);
      });

})



///Search data
const email_search = document.querySelector("#email_search");
const dni_search = document.querySelector("#dni_search");

const btn_search = document.querySelector("#btn_search");

//boton que me permite consumir la api de busqueda
btn_search.addEventListener("click", function (event){

    axios.get('/api/customers/get_customers', {
        params: {
          token: token,
          email: email_search.value,
          dni: dni_search.value,
        }
      })
      .then(function (response) {

        const data = response.data.data;


        if (response.data.status == true) {


            const content_table = document.querySelector("#content_table");

            let rows_customres = ``;


            //formar filas
            data.forEach(d => {

                rows_customres += `<tr id="row_customer">
                <td id="dni_row_customers">${d.dni}</td>
                 <td>${d.description_region}</td>
                  <td>${d.description_commune}</td>
                   <td>${d.email}</td>
                    <td>${d.name}</td>
                     <td>${d.lastname}</td>
                      <td>${d.address}</td>
                       <td>${d.date_reg}</td>
                        <td>${d.status}</td>
                         <td>

                         <button class="btn btn-danger" id="btn_delete_customer"><i class="bi bi-trash-fill"></i></button></td>
                </tr>`;
            });

            //contenedor de tabla
            const table = `<div class="table-responsive border my-3">
                      <table class="table" id="table_customers">
                        <thead>
                            <th>DNI</th>
                            <th>Region</th>
                            <th>Commune</th>
                            <th>email</th>
                            <th>name</th>
                            <th>lastname</th>
                            <th>address</th>
                            <th>date_reg</th>
                            <th>status</th>
                            <th>actions</th>
                        </thead>

                        <tbody>
        ${rows_customres}
                        </tbody>
                      </table>
                    </div>`;


                    //pitantar tabla
                    content_table.innerHTML = table;

                    //activar datatables
                    activate_table_customers();

                    //activar botones de eliminacion
                    const rows_customer = document.querySelectorAll("#row_customer");
                    activate_btn_delete_customer(rows_customer);

        }else{
            //alerta de error
            const message = response.data.message;
            Swal.fire({
                title: "oppss! algo salio mal",
                text: message,
                icon: "error"
              });

              setTimeout(() => {
                window.location = "/login";
              }, 3000);


        }

      })
      .catch(function (error) {
                 //alerta de error
       alert(error);

       setTimeout(() => {
        window.location = "/login";
      }, 3000);
      });


})




//funcion que activa los botones de eliminacion de la filas
function activate_btn_delete_customer(rows_customer){

    rows_customer.forEach(r => {

        const dni_row_customers = r.querySelector("#dni_row_customers");
        const btn_delete_customer = r.querySelector("#btn_delete_customer");


        btn_delete_customer.addEventListener("click", function (e) {
            e.preventDefault();


            console.log(dni_row_customers.innerHTML);
    axios.post('/api/customers/delete', {
        dni: dni_row_customers.innerHTML,
        token:token,
      })
      .then(function (response) {
        console.log(response);


        //al eliminar mostrar un mensaje de confirmacion
        if (!response.data.status) {

            Swal.fire({
                title: "Oppss...",
                text: response.data.message,
                icon: "error"
              });

        }else{

         Swal.fire({
                title: "Nice!",
                text: response.data.message,
                icon: "success"
              });

              r.remove();

        }
      })
      .catch(function (error) {
        console.log(error);
        alert(error);
      });

        })

    });
}
