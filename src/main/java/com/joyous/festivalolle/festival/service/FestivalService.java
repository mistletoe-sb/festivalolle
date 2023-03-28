package com.joyous.festivalolle.festival.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.repository.IFestivalRepository;

@Service
public class FestivalService implements IFestivalService {
	
	@Autowired
	private IFestivalRepository festivalRepository;	// FestivalRepository 객체

	@Override
	public List<FestivalVO> selectFestivalList(int organizationCode) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11"+organizationCode);
		return festivalRepository.selectFestivalList(organizationCode);
	}

	@Override
	public FestivalVO selectFestivalInfo(int festivalCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFestival(FestivalVO vo) {
		festivalRepository.insertFestival(vo);
		festivalRepository.insertFestivalImage(vo);

	}

	@Override
	public void updateFestival(FestivalVO vo) {
		// TODO Auto-generated method stub

	}
/*
	@Override
    public List<String> getAreaList() throws Exception {
        // RestTemplate을 사용하여 API 호출을 수행
        RestTemplate restTemplate = new RestTemplate();
        //String apiUrl = "https://api.odcloud.kr/api/15066113/v1/uddi:b72a7ab6-9c27-44ad-937e-93188c67c53d?";//"http://apis.data.go.kr/1741000/DisasterMsg2/getDisasterMsgList";
        String apiUrl = "https://api.odcloud.kr/api/15066113/v1/uddi:b72a7ab6-9c27-44ad-937e-93188c67c53d?page=1&perPage=100&serviceKey=wbPsYjPSUkcrYY16HOt+I8oNpgsZYnzUxySdwf4hEtinJAeFR2jug+eIk8QZae6542O+dZJiIyUwC2CamDikLA==";//"http://apis.data.go.kr/1741000/DisasterMsg2/getDisasterMsgList";
        // 필요한 파라미터를 설정합니다. 여기서는 최신 데이터 1,000개를 가져오고, JSON 형식으로 결과를 받아오도록 설정
        String serviceKey = "wbPsYjPSUkcrYY16HOt+I8oNpgsZYnzUxySdwf4hEtinJAeFR2jug+eIk8QZae6542O+dZJiIyUwC2CamDikLA==";
        String numOFRows = "100";
        String type = "json";
        // 호출에 필요한 URL 파라미터를 구성
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(apiUrl)
                .queryParam("serviceKey", serviceKey);
////                .queryParam("numOfRows", numOFRows)
//                .queryParam("perPage", numOFRows)
//                .queryParam("returnType", type);
        // 호출 결과를 받아옵니다.
        //ResponseEntity<String> response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, null, String.class);
        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, null, String.class);
        String body = response.getBody();

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = objectMapper.readTree(body);
        JsonNode itemsNode = rootNode.path("DisasterMsg");
        JsonNode itemNode = itemsNode.get("row");

        List<String> areaList = new ArrayList<>();

        for(JsonNode node : itemNode){
            String location = node.get("location_name").asText();
            String[] locationArray = location.split(" ");

            if(locationArray.length > 2){
                areaList.add(locationArray[2]);
            }else{
                areaList.add(locationArray[1]);
            }
        }

        return areaList;
    }
    */

}
