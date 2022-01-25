/**
 * 
 */
 const file = document.getElementById("file");
 console.log(file);
 
 console.log("js connected");
 
  
 function checkFileSize(file){
 	console.log("change occured");
 	for (let i=0; i<file.files.length; i++){
 		let curFile = file.files[i];
	 	const size = (curFile.size / 1024 / 1024).toFixed(2);
	 	console.log(curFile);	
	 	console.log(size);
	 	let result = false
	 	if (size > 1 || size < 0){
	 	alert(`${curFile.name} is too large (${size}MB). File must not exceed 1MB.`);
		file.value = "";
	 	} 
	}	
}

/*
$("#file").on('change', ()=>{
	console.log("this is running");
	checkFileSize(file)
});
*/

/* 
$("#addBtn").click((event)=> {
	let result = false;
	console.log("clicked");	
	console.log(file.files.length);
	if(file.files.length < 1){
	 	let result = window.confirm("No image included. Continue anyway?");
	 	console.log(result)
		if(!result){
			event.preventDefault();
		}
	}
}); */


