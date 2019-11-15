// $.tableFlipScroll = function(selector){
//     var $obj = $(selector);
//
//     function matchCellsHeights(columnIndex){
//         columnIndex++;
//         var $cellsForCol = $obj.find('th:nth-child('+columnIndex+'), td:nth-child('+columnIndex+')');
//         var columnCellsHeights = $.map($cellsForCol, function(val){
//             return $(val).outerHeight();
//         });
//
//         var columnHighestCell = Math.max.apply(null, columnCellsHeights);
//
//         $cellsForCol.css('height', columnHighestCell +'px');
//     }
//
//     var $th = $obj.find('th');
//     $th.each(function(index){
//         matchCellsHeights(index);
//     });
// }
//
// $(document).ready(function() {
//      $.tableFlipScroll('.table-flip-scroll');
// })


/* not using this */
