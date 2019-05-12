<template>
    <div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Responsive Hover Table</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#addUserModal">Add New</button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tbody><tr>
                                <th>#</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Type/Role</th>
                                <th>Modify</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>1</td>
                                <td>John Doe</td>
                                <td>abc@abc.com</td>
                                <td>Admin</td>
                                <td style="width:100px;">
                                    <a class="btn btn-outline-primary btn-sm" href="#"><i class="fas fa-pencil-alt"></i></a>
                                    <a class="btn btn-outline-danger btn-sm" href="#"><i class="fas fa-trash"></i></a>
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
            <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addUserModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
