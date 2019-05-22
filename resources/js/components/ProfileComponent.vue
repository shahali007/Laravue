<template>
    <div>
        <div class="content-header">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2 class="m-0 text-dark">Profile</h2>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><router-link to="/home">Home</router-link></li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <!-- Profile Image -->
                <div class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <div class="text-center">
                            <img class="profile-user-img img-fluid img-circle" :src="getProfilePhoto()" alt="User profile picture">
                        </div>
                        <h3 class="profile-username text-center">{{form.name}}</h3>
                        <p class="text-muted text-center">Web Developer</p>
                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b>Followers</b> <a class="float-right">1,322</a>
                            </li>
                            <li class="list-group-item">
                                <b>Following</b> <a class="float-right">543</a>
                            </li>
                            <li class="list-group-item">
                                <b>Friends</b> <a class="float-right">13,287</a>
                            </li>
                        </ul>
                        <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                    </div>
                </div>
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header p-2">
                        <ul class="nav nav-pills">
                            <li class="nav-item"><a class="nav-link" href="#activity" data-toggle="tab">Activity</a></li>
                            <li class="nav-item"><a class="nav-link active show" href="#settings" data-toggle="tab">Settings</a></li>
                        </ul>
                    </div><!-- /.card-header -->
                    <div class="card-body">
                        <div class="tab-content">
                            <div class="tab-pane" id="activity">
                                <h4>User activity goes here.</h4>
                            </div>

                            <div class="tab-pane active show" id="settings">
                                <form class="form-horizontal" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="inputName" class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-10">
                                            <input v-model="form.name" type="text" class="form-control" id="inputName" placeholder="Name" v-bind:class="{ 'is-invalid' : form.errors.has('name') }">
                                            <has-error v-bind:form="form" field="name"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                        <div class="col-sm-10">
                                            <input v-model="form.email" type="email" class="form-control" id="inputEmail" placeholder="Email" v-bind:class="{ 'is-invalid' : form.errors.has('email') }">
                                            <has-error v-bind:form="form" field="email"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="photo" class="col-sm-2 control-label">Photo</label>

                                        <div class="col-sm-10">
                                            <input v-on:change="updatePhoto" type="file" class="form-control" name="photo" id="photo" placeholder="Photo">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" v-on:click.prevent="updateInfo" class="btn btn-danger">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
            return {
                form: new Form({
                    id : '',
                    name: '',
                    email: '',
                    password: '',
                    password_confirmation: '',
                    remember_token: true,
                    photo : ''
                })
            }
        },
        methods : {
            getProfilePhoto(){
                let photo = (this.form.photo.length > 200) ? this.form.photo : "images/profile/"+this.form.photo;
                return photo;
            },
            updatePhoto(element){
                let file = element.target.files[0];

                //console.log(file['size']);
                let reader = new FileReader();
                if (file['size'] < 2097152){
                    reader.onloadend = (file)=> {
                        //console.log('RESULT', reader.result);
                        this.form.photo = reader.result;
                    };
                    reader.readAsDataURL(file);
                }
                else {
                    Swal.fire({
                        type:  'error',
                        title: 'Oops...',
                        text:  'Your file is larger than 2MB.'
                    });
                }
            },
            updateInfo(){
                this.form.put('api/profile')
                    .then(()=>{
                        this.$Progress.start();
                        Fire.$emit('AfterUpdate');
                        Swal.fire(
                            'success!',
                            'User information has been updated.',
                            'success'
                        );

                        this.$Progress.finish();
                    })
                    .catch(()=>{
                        this.$Progress.fail();
                    });
            }
        },
        mounted() {
            console.log('Component mounted.')
        },
        created(){
            axios.get("api/profile")
                .then(({data}) => (this.form.fill(data)));
        }
    }
</script>

