marked = require '../../components/marked/lib/marked'

angular.module('blog').filter 'markdown', ['$sce', ($sce) ->
  (markdown) ->
    $sce.trustAsHtml marked markdown
]
