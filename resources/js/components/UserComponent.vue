<template>
    <div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Responsive Hover Table</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-outline-success" data-toggle="modal"
                                    data-target="#addUserModal">Add New
                            </button>
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
                                    <button class="btn btn-outline-primary btn-sm"><i class="fas fa-pencil-alt"></i></button>
                                    <button class="btn btn-outline-danger btn-sm"><i class="fas fa-trash"></i></button>
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
                            <h5 class="modal-title" id="addUserModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form @submit.prevent="createUser" @keydown="form.onKeydown($event)">
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
                                <button type="submit" class="btn btn-danger">Submit</button>
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
        data () {
            return {
                users : {},
                // Create a new form instance
                form: new Form({
                    name: '',
                    email: '',
                    password: '',
                    password_confirmation: '',
                    remember_token: true
                })
            }
        },
        methods :{
            loadUsers(){
                axios.get('api/user').then(({data})=> {this.users = data.data;console.log(data);});
            },
            createUser(){
                this.form.post('api/user')
                    .then(({ data }) => { console.log(data) });
                console.log('Create user fired!');
            }
        },
        created(){
            this.loadUsers();
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
