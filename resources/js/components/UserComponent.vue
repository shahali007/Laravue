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
                        <h3 class="card-title">Responsive Hover Table</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                                Add New
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tbody><tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Registered at</th>
                                <th>Modify</th>
                            </tr>
                            <tr v-for="(user,index) in users">
                                <td>{{ index+1 }}</td>
                                <td>{{ user.name }}</td>
                                <td>{{ user.email }}</td>
                                <td>{{ user.created_at }}</td>
                                <td>
                                    <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fas fa-pencil-alt"></i></button>
                                    <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
                <!-- Modal -->
                <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addModalLabel">Add New</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form @submit.prevent="userAction" @keydown="form.onKeydown($event)">
                                <div class="modal-body">
                                    <!--<form @submit.prevent="login" @keydown="form.onKeydown($event)">
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input v-model="form.username" type="text" name="username"
                                                  class="form-control" :class="{ 'is-invalid': form.errors.has('username') }">
                                            <has-error :form="form" field="username"></has-error>
                                        </div>

                                        <div class="form-group">
                                            <label>Password</label>
                                            <input v-model="form.password" type="password" name="password"
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                                            <has-error :form="form" field="password"></has-error>
                                        </div>

                                        <button :disabled="form.busy" type="submit" class="btn btn-primary">Log In</button>
                                    </form>-->

                                    <div class="form-group row">
                                        <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
                                        <div class="col-md-6">
                                            <input v-model="form.name" type="text" name="name" id="name" value="" :class="{ 'is-invalid': form.errors.has('name') }" class="form-control">
                                            <has-error :form="form" field="name"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                                        <div class="col-md-6">
                                            <input v-model="form.email" type="email" name="email" id="email" value="" :class="{ 'is-invalid': form.errors.has('email') }" class="form-control">
                                            <has-error :form="form" field="email"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                        <div class="col-md-6">
                                            <input type="password" name="password" v-model="form.password" id="password" :class="{ 'is-invalid': form.errors.has('password') }" class="form-control">
                                            <has-error :form="form" field="password"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="password-confirm" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
                                        <div class="col-md-6">
                                            <input id="password-confirm" type="password" v-model="form.password_confirmation" name="password_confirmation" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    <button :disabled="form.busy" type="submit" class="btn btn-success">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                users : {},
                form : new Form({
                    name : '',
                    email : '',
                    password : '',
                    password_confirmation : ''
                })
            }
        },
        mounted() {
            console.log('Component mounted.');
            document.onreadystatechange = () => {
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                })
            }
        },
        methods : {
            userAction(){
                this.form.post('/api/user').then(({ data }) => { console.log(data) });
            },
            loadUsers(){
                axios.get('api/user').then(({data}) => (this.users = data.data));
            }
        },
        created(){
            this.loadUsers();
        }
    }
</script>
