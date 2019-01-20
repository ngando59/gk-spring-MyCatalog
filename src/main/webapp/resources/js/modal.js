function Modal(title,content){
	this.title = title;
	this.content = content;	
}
Modal.prototype.getHtmlContent = function() {
	return(
		'<div class="dialog">\n'+
   			'<div class="dialog-content">\n'+
    			'<div class="dialog-header">\n'+
       				'<button type="button" class="close" onclick="$.fancybox.close()"><span>×</span></button>\n'+
       				'<h4 class="dialog-title">'+this.title+'</h4>\n'+
    			'</div>\n'+
    			'<div class="dialog-body">\n'+
       				this.content+
    			'</div>\n'+
    			'<div class="dialog-footer">\n'+
      				'<button type="button" class="btn btn-default" onclick="$.fancybox.close()">OK</button>\n'+
    			'</div>\n'+
    		'</div>\n'+
  		'</div>\n');
}
