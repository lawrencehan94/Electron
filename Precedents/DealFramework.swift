class Deal {
	//Inputs
	let announceMonth: Int
	let announceYear: Int  
	let target: String
	let acquiror: String
	let equityValue: Double
	let enterpriseValue: Double
	let ltmEVRev: Double
	let ntmEVRev: Double
	let ltmEVEBITDA: Double
	let ntmEVEBITDA: Double
	let ltmPE: Double
	let ntmPE: Double
	let oneDay: Double
	let thirtyDay: Double
	let unaffectedMonth: Int
	let unaffectedYear: Int
	let description: String
	
	// Calculated Inputs
	let ntmRevGrowth: Double
	let ltmEBITDAMargin: Double
	let ntmEBITDAMargin: Double
	let ltmNIMargin: Double
	let ntmNIMargin: Double 
	
	init(_ announceMonthInput: Int, _ announceYearInput: Int, _ targetInput: String, _ acquirorInput: String, _ equityValueInput: Double, _ enterpriseValueInput: Double, _ ltmEVRevInput: Double, _ ntmEVRevInput: Double, _ ltmEVEBITDAInput: Double, _ ntmEVEBITDAInput: Double, _ ltmPEInput: Double, _ ntmPEInput: Double, _ oneDayInput: Double, _ thirtyDayInput: Double, _ unaffectedMonthInput: Int, _ unaffectedYearInput: Int, _ descriptionInput: String) {
	announceMonth = announceMonthInput
	announceYear = announceYearInput  
	target = targetInput
	acquiror = acquirorInput
	equityValue = equityValueInput
	enterpriseValue = enterpriseValueInput
	ltmEVRev = ltmEVRevInput
	ntmEVRev = ntmEVRevInput
	ltmEVEBITDA = ltmEVEBITDAInput
	ntmEVEBITDA = ntmEVEBITDAInput
	ltmPE = ltmPEInput
	ntmPE = ntmPEInput
	oneDay = oneDayInput
	thirtyDay = thirtyDayInput
	unaffectedMonth = unaffectedMonthInput
	unaffectedYear = unaffectedYearInput
	description = descriptionInput
		
	ntmRevGrowth = (ltmEVRev / ntmEVRev) - 1
	ltmEBITDAMargin = ltmEVRev / ltmEVEBITDA
	ntmEBITDAMargin = ntmEVRev / ntmEVEBITDA
	ltmNIMargin = ltmEVRev / ltmPE //assumes equity value = enterprise value
	ntmNIMargin = ntmEVRev / ntmPE //assumes equity value = enterprise value
	
	}
		
}

var deals = [Deal]()

func addSemisDeals(){


}

addSemisDeals()

for deal in deals {
	print(deal.description)
}
