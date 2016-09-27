// $.attachinary.config.template = '\
//   <p>Preview:</p>\
//   <ul class="attachinary-preview list-unstyle list-inline">\
//     <% for(var i=0; i<files.length; i++){ %>\
//       <li>\
//         <% if(files[i].resource_type == "raw") { %>\
//           <div class="raw-file"></div>\
//         <% } else { %>\
//           <img\
//             src="<%= $.cloudinary.url(files[i].public_id, { "version": files[i].version, "format": "jpg", "height": 250 }) %>"\
//             alt="" height="150" />\
//         <% } %>\
//         <a href="#" data-remove="<%= files[i].public_id %>"><i class="md md-clear md-2x"></i></a>\
//       </li>\
//     <% } %>\
//   </ul>\
// ';
