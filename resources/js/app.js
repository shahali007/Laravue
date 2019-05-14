/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
window.Vue = require('vue');


/**
|-------------------------------------------------
| @Progress bar
| @npm package name : 'vue-progressbar'
|-------------------------------------------------
*/
import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
    height: '12px',
    color: 'rgb(0, 255, 123)',
    failedColor: 'red'
});


/**
|-------------------------------------------------
| @Form validation
| @npm package name : 'vform'
|-------------------------------------------------
*/
import { Form, HasError, AlertError } from 'vform'
window.Form = Form;
Vue.component(HasError.name, HasError);
Vue.component(AlertError.name, AlertError);


/**
 |-------------------------------------------------
 | @sweetalert for alert, confirm, success popup
 | @npm package name : 'sweetalert2'
 |-------------------------------------------------
 */
import Swal from 'sweetalert2';
window.Swal = Swal;
const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});
window.Toast = Toast;



/**
|-------------------------------------------------
| @Vue JS Router
| @npm package name : 'vue-router'
|-------------------------------------------------
*/
import VueRouter from 'vue-router'
Vue.use(VueRouter);
const routes = [
    { path: '/home', component: require('./components/HomeComponent').default },
    { path: '/dashboard', component: require('./components/DashboardComponent').default },
    { path: '/profile', component: require('./components/ProfileComponent').default },
    { path: '/users', component: require('./components/UserComponent').default }
];
const router = new VueRouter({
    mode: 'history',
    routes
});


/**
|-------------------------------------------------
| @Custom Global Functions
| @depends on : 'Vue.mixin'
| @every function must create inside 'methods'
|-------------------------------------------------
*/
Vue.mixin({
    methods: {
        formatDateMysql(mysqldate) {
            // regular expression split that creates array with: year, month, day, hour, minutes, seconds values
            let dateTimeParts= mysqldate.split(/[- :]/);

            // monthIndex begins with 0 for January and ends with 11 for December so we need to decrement by one
            dateTimeParts[1]--;
            const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            ];

            const d = new Date(...dateTimeParts); // our Date object
            var dd   = d.getDate();
            var hour = d.getHours();
            var minu = d.getMinutes();

            if(dd<10)  { dd='0'+dd }
            if(minu<10){ minu='0'+minu }

            var amOrPm = (d.getHours() < 12) ? "AM" : "PM";
            var hour = (d.getHours() < 12) ? d.getHours() : d.getHours() - 12;
            // monthNames[d.getUTCMonth()].toUpperCase()+" "+dd+", "+d.getUTCFullYear()+" "+hour+":"+minu +" "+amOrPm;
            return monthNames[d.getUTCMonth()]+" "+dd+", "+d.getUTCFullYear();
        }
    }
});


/**
 |-------------------------------------------------
 | @Fire
 |
 |-------------------------------------------------
 */
window.Fire = new Vue();

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */



/**
|-------------------------------------------------
| Initialization
|-------------------------------------------------
*/
const app = new Vue({
    router
}).$mount('#app')
