<template>
    <div>
        <div class="content-header">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2 class="m-0 text-dark">User List</h2>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><router-link to="/home">Home</router-link></li>
                        <li class="breadcrumb-item active">User List</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">User List</h3>
                        <div class="card-tools">
                            <!--<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#addUserModal">Add New</button>-->
                            <a href="">ss</a>
                            <button type="button" class="btn btn-outline-success" v-on:click="newModal">Add New</button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>#</th>
                                <th>Name</th>

                                <th>Email</th>
                                <th>Registered Date</th>
                                <th>Modify</th>
                            </tr>
                            <tr v-for="(user, index) in users" v-bind:key="user.id">
                                <td>{{ index+1 }}</td>
                                <td>{{ user.name }}</td>
                                <td>{{ user.email }}</td>
                                <td>{{ formatDateMysql(user.created_at) }}</td>
                                <td style="width:100px;">
                                    <button class="btn btn-outline-primary btn-sm" v-on:click="editModal(user)" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fas fa-pencil-alt"></i></button>
                                    <button class="btn btn-outline-danger btn-sm" v-on:click="deleteUser(user)" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- Modal -->
            <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addUserModalLabel">
                                <span v-show="!editmode">Add New</span>
                                <span v-show="editmode">Update user information <small class="d-none"> - {{ updateUserName }}</small></span>
                            </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form @submit.prevent="editmode ? updateUser() : createUser()" @keydown="form.onKeydown($event)">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text" name="name" id="name" placeholder="Name" v-model="form.name" class="form-control" v-bind:class="{ 'is-invalid' : form.errors.has('name') }">
                                        <has-error v-bind:form="form" field="name"></has-error>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                                    <div class="col-md-6">
                                        <input type="email" name="email" id="email" placeholder="Email" v-model="form.email" v-bind:class="{'is-invalid' : form.errors.has('email')}" class="form-control" >
                                        <has-error v-bind:form="form" field="email"></has-error>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" name="password" id="password" v-model="form.password" v-bind:class="{'is-invalid' : form.errors.has('password')}" class="form-control" >
                                        <has-error v-bind:form="form" field="password"></has-error>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password_confirmation" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
                                    <div class="col-md-6">
                                        <input type="password" name="password_confirmation" id="password_confirmation" v-model="form.password_confirmation" v-bind:class="{'is-invalid' : form.errors.has('password_confirmation')}" class="form-control" >
                                        <has-error v-bind:form="form" field="password"></has-error>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button v-show="editmode" type="submit" class="btn btn-success">Update</button>
                                <button v-show="!editmode" type="submit" class="btn btn-danger">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data ()
        {
            return{
                editmode : false,
                updateUserName : '',
                users : {},
                form: new Form({
                    id : '',
                    name: '',
                    email: '',
                    password: '',
                    password_confirmation: '',
                    remember_token: true
                })
            }
        },
        methods :{
            editModal(user){
                this.editmode = true;
                $('#addUserModal').modal('show');
                this.form.fill(user);
                this.updateUserName = user.name;
            },
            newModal(){
                this.editmode = false;
                $('#addUserModal').modal('show');
                this.form.reset();
            },

            createUser(){
                this.form.post('api/user')
                .then(() => {
                    this.$Progress.start();
                    Fire.$emit('AfterCreate');
                    $('#addUserModal').modal('hide');
                    Swal.fire({
                        position: 'top-end',
                        type: 'success',
                        title: 'User has been added successfully',
                        showConfirmButton: false,
                        timer: 3000
                    });
                    this.$Progress.finish();
                });
            },
            loadUsers(){
                axios.get('api/user')
                .then(({data})=> {
                    this.users = data.data;
                    /*console.log(data);*/
                });
            },
            updateUser(id){
                this.form.put('api/user/'+this.form.id)
                .then(()=>{
                    this.$Progress.start();
                    $('#addUserModal').modal('hide');
                    Swal.fire(
                        'success!',
                        'User information has been updated.',
                        'success'
                    );
                    this.$Progress.finish();
                    Fire.$emit('AfterCreate');
                })
                .catch((errors)=>{
                    console.log(errors);
                });
            },

            deleteUser(user){
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d81b38',
                    cancelButtonColor: '#3d3d3d',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        this.form.delete('api/user/'+user.id)
                        .then(()=>{
                            Swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            );
                            Fire.$emit('AfterCreate');
                        })
                        .catch(()=>{
                            Swal("Failed!","There was something wrong!","warning");
                        });

                    }
                })
            }
        },
        created(){
            this.loadUsers();
            Fire.$on('AfterCreate', ()=> {
                this.loadUsers()
            });
            //setInterval(() => this.loadUsers(), 3000);
        },
        mounted() {
            //console.log('Component mounted.');
            document.onreadystatechange = () => {
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                })

            }
        }
    }
</script>
