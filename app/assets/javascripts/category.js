// $(function () {

//   function buildHtmlAddChildCategory() {
//     var html = `
//                 <div class="form__post__category__label__cat__child>
//                   <select class="select-default category-children" name="post[category_id]" id="post_category_id">
//                     <option value="">---</option>
//                   </select>
//                 </div>
//                 `
//     return html;
//   }

//   function buildHtmlAddCategory(category) {
//     var html = `
//                 <option value="${category.id}">${category.name}</option>
//                 `
//     return html;
//   }

//   $(".category-parent").on("change", function(e) {
//     $(".form__post__category__label__cat__child").remove();
//     var category_id = $(this).val();
//     var formData = new FormData();
//     formData.append('category_id', category_id);
//     $.ajax({
//       type: "POST",
//       url: "/posts/get_category_id",
//       data: formData,
//       processData: false,
//       contentType: false,
//     })
//     .done(function(data) {
//       var html = buildHtmlAddChildCategory();
//       $(".form__post__category__label").append(html);

//       data.forEach(function(category) {
//         var optionHtml = buildHtmlAddCategory(category);
//         $(".category-children").append(optionHtml);
//       });
//     })
//     .fail(function(data) {
//       alert("fail")
//     })
//   })
// })
