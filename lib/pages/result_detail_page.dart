import 'package:flutter/material.dart';
import 'package:flutter_login/Data/response/predict_response.dart';
import 'select_page.dart';
import 'dart:io';


class ResultDetailPage extends StatelessWidget {
  final String imagePath;
  final PredictResponse result;

  ResultDetailPage(this.result, this.imagePath);

  @override
  Widget build(BuildContext context) {

    String emotionText = '';
    // 결과 값이 감정에 따라 텍스트와 이모티콘을 지정
    IconData emotionIcon = Icons.sentiment_neutral;
    Color emotionColor = Colors.grey;

    switch (result.emotion) {
      case "Happy":
        emotionText = '당신은 강아지는 행복한 기분입니다. \n\n';
        emotionText += '강아지가 행복할 때 하는 행동:\n';
        emotionText +=
        '1. 꼬리를 흔들기: 행복한 강아지는 꼬리를 빠르게 흔들거나 흔들흔들거리는 모습을 보일 수 있습니다.\n\n';
        emotionText +=
        '2. 즐겁게 뛰기: 행복한 강아지는 즐겁게 뛰어다닐 수 있습니다. 놀이를 즐기거나 주인과 함께 활동하는 등의 행동을 할 때 더욱 활발하게 움직일 수 있습니다.\n\n';
        emotionText +=
        '3. 초롱초롱한 눈빛: 강아지의 눈이 반짝이며 즐거운 기분을 내는 것을 볼 수 있습니다.\n\n';
        emotionText +=
        '4. 놀이 요청: 행복한 강아지는 주변 사물이나 주인과의 상호작용을 통해 놀이를 요청할 수 있습니다. 장난감을 가져오거나 산책을 요구하는 행동 등이 이에 해당합니다.\n\n';
        emotionText += '해주면 좋은 행동:\n';
        emotionText +=
        '1. 마사지: 강아지의 근육을 마사지해주면 편안함을 느낄 수 있습니다. 특히 배에 살짝 손을 올려 마사지를 해주는 것은 강아지에게 안정감을 줄 수 있습니다.\n\n';
        emotionText +=
        '2. 놀이 시간: 강아지와 함께 놀이를 즐기는 시간을 가집니다. 강아지는 활동적인 놀이를 통해 에너지를 소비하고 즐겁게 시간을 보낼 수 있습니다.\n\n';
        emotionText +=
        '3. 간식: 행복한 강아지에게는 맛있는 간식을 주어 보상해줍니다. 이는 강아지가 원하는 행동을 강화하는데 도움이 됩니다.\n\n';
        emotionText +=
        '4. 애정 표현: 강아지에게 애정과 관심을 표현합니다. 스트로크, 애정 언어 사용 등으로 강아지에게 안전하고 사랑받는 환경을 제공합니다.\n\n';
        emotionText +=
        '이러한 행동과 함께, 주인의 애정과 관심을 통해 강아지가 행복하고 안전하게 느낄 수 있도록 돌보는 것이 중요합니다.\n';
        emotionIcon = Icons.sentiment_very_satisfied;
        emotionColor = Colors.yellow;
        break;

      case "Angry":
        emotionText = '당신은 강아지는 화난 기분입니다. \n\n';
        emotionText += '강아지가 화났을 때 하는 행동:\n';
        emotionText +=
        '1. 으르렁거리기: 강아지는 화가 날 때 또는 위협을 느낄 때 으르렁거릴 수 있습니다.\n\n';
        emotionText +=
        '2. 털을 세우기: 화난 강아지는 몸을 크게 펴고 털을 세우는 경우가 있습니다.\n\n';
        emotionText +=
        '3. 성격 변화: 화난 강아지는 평소와 다른 행동을 보일 수 있습니다. 예를 들어, 식욕 감소, 소리 지르기 등의 변화가 나타날 수 있습니다.\n\n';
        emotionText += '해주면 좋은 행동:\n';
        emotionText +=
        '1. 차분하게 대하기: 강아지가 화났을 때도 차분하고 안정적으로 대하는 것이 중요합니다. 너무 급하게 접근하지 않고, 부드럽고 안정된 목소리로 강아지에게 말을 걸어보세요.\n\n';
        emotionText +=
        '2. 무시하기: 가끔은 강아지의 화난 행동을 무시하는 것이 좋을 수 있습니다. 화를 내는 행동을 보일 때마다 주의를 끌거나 반응하는 것은 강아지에게 화를 더 부추기는 결과를 가져올 수 있습니다.\n\n';
        emotionText +=
        '3. 안전한 장소 제공: 강아지가 화를 냈을 때는 안전한 장소를 제공해 주세요. 강아지가 스트레스를 풀고 조용한 곳에서 시간을 보내도록 해주세요.\n\n';
        emotionText +=
        '4. 피해 방지: 화가 난 강아지가 주변에 있는 물건이나 다른 동물, 사람을 공격하지 않도록 조치해야 합니다. 강아지를 다른 방향으로 이동시키거나, 화가 가라앉을 때까지 다가가지 않는 것이 좋습니다.\n\n';
        emotionText +=
        '화가 난 강아지에게는 안전하고 안정된 환경을 제공하여 스트레스를 완화시키고, 부드러운 대화와 차분한 태도로 강아지의 마음을 진정시켜 주는 것이 중요합니다. 만약 강아지의 화가 장기간 지속되거나 공격적인 행동이 심각하다면 전문가의 도움을 받는 것이 좋습니다.\n';
        emotionIcon = Icons.sentiment_very_dissatisfied;
        emotionColor = Colors.red;
        break;

      case "Scared":
        emotionText = '당신은 강아지는 두려운 기분입니다.\n\n';
        emotionText += '강아지가 두려울 때 하는 행동:\n';
        emotionText +=
        '1. 바싹 움츠리기: 두려워하는 강아지는 몸을 바싹 움츠릴 수 있습니다. 귀를 내려놓고 몸을 낮추는 모습을 보일 수 있습니다.\n\n';
        emotionText +=
        '2. 떨기: 두려워하는 강아지는 몸이 떨거나 전신에 떨림이 나타날 수 있습니다.\n\n';
        emotionText +=
        '3. 피하기: 강아지는 두려운 상황에서는 피하려고 할 수 있습니다. 사람들이나 다른 동물, 물건을 피하거나 피해야 할 상황에서 일부러 피하려 할 수 있습니다.\n\n';
        emotionText +=
        '4. 소리 내지 않기: 두려워하는 강아지는 소리를 내지 않거나, 조용한 울음소리를 내기도 합니다.\n\n';
        emotionText += '해주면 좋은 행동:\n';
        emotionText +=
        '1. 안정된 환경 제공: 두려워하는 강아지에게는 안전하고 조용한 환경을 제공해주세요. 강아지의 스트레스가 줄어들고 안정된 상황에서는 덜 두려워할 수 있습니다.\n\n';
        emotionText +=
        '2. 안심시켜주기: 강아지에게 안심이 되는 존재가 되어주세요. 부드러운 목소리로 강아지를 안심시켜주고, 두려워하는 상황을 피하거나 제거해주세요.\n\n';
        emotionText +=
        '3. 양성적인 강화: 두려워하는 상황에서도 강아지에게 양성적인 경험을 제공해주세요. 강아지가 두려워하는 상황에서도 간식이나 칭찬으로 긍정적인 감정을 유도해주세요.\n\n';
        emotionText +=
        '4. 훈련과 사회화: 강아지에게 두려워하는 상황에 대한 훈련을 진행해주세요. 이를 통해 강아지가 두려워하는 것에 대한 자신감을 키울 수 있습니다. 또한 다른 사람이나 동물과의 만남을 통해 사회화를 진행해주세요.\n\n';
        emotionText +=
        '강아지가 두려워할 때는 주인의 안전과 안정이 필요합니다. 강아지를 진정시켜주고, 긍정적인 경험을 제공하여 두려움을 극복할 수 있도록 도와주세요. 만약 강아지가 두려워하는 상황이 지속된다면, 전문가의 도움을 받는 것이 좋습니다.\n';
        emotionIcon = Icons.sentiment_very_dissatisfied;
        emotionColor = Colors.purple;
        break;

      case "Sad":
        emotionText = '당신은 강아지는 슬픈 기분입니다.\n\n';
        emotionText += '강아지가 슬플 때 하는 행동:\n';
        emotionText +=
        '1. 무기력한 모습: 강아지가 슬플 때는 무기력한 모습을 보일 수 있습니다. 일상적으로 즐겁게 행동하지 않고, 자리에 누워 있는 경우가 많습니다.\n\n';
        emotionText +=
        '2. 음식 거부: 슬픈 강아지는 음식을 거부할 수 있습니다. 식욕이 감소하거나 음식에 관심을 보이지 않을 수 있습니다.\n\n';
        emotionText +=
        '3. 사람들과 소통을 피하기: 슬픈 강아지는 주인이나 다른 사람들과의 소통을 피할 수 있습니다. 피하거나 피해야 할 상황을 만나면 피하려고 할 수 있습니다.\n\n';
        emotionText +=
        '4. 오랫동안 잠들거나 쉬기: 강아지가 슬플 때는 더 오랫동안 잠들거나 쉴 수 있습니다. 활동량이 감소하고, 에너지가 없는 모습을 보일 수 있습니다.\n\n';
        emotionText += '해주면 좋은 행동:\n';
        emotionText +=
        '1. 애정과 관심 표현: 강아지에게 애정과 관심을 표현해주세요. 부드럽고 따뜻한 손길이나 칭찬을 통해 강아지를 위로해주세요.\n\n';
        emotionText +=
        '2. 즐거운 활동 제공: 강아지와 함께 즐거운 활동을 제공해주세요. 산책이나 놀이를 통해 강아지가 즐거워할 수 있는 시간을 보내도록 도와주세요.\n\n';
        emotionText +=
        '3. 피로 풀기: 강아지가 슬플 때는 피로를 풀 수 있는 활동을 제공해주세요. 마사지를 해주거나, 간식을 주어 강아지의 기분을 확실하게 전환시켜주세요.\n\n';
        emotionText +=
        '4. 안전한 환경 제공: 강아지에게 안전하고 안정된 환경을 제공해주세요. 강아지가 슬픈 상태에서도 안전하고 편안한 환경에서 머무를 수 있도록 도와주세요.\n\n';
        emotionText +=
        '슬픔은 모든 생물에게 자연스러운 감정입니다. 강아지가 슬플 때는 주인이 따뜻한 마음으로 돌봐주고, 힐링할 수 있는 시간과 환경을 제공해주세요. 만약 강아지의 슬픔이 지속된다면, 동물 병원에서 전문가의 도움을 받는 것이 좋습니다.\n';
        emotionIcon = Icons.sentiment_dissatisfied;
        emotionColor = Colors.blue;
        break;
      default:
        emotionText = '당신은 강아지의 감정을 파악할 수 없습니다.';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('결과 페이지'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(
                File(imagePath),
                width: 300, // 원하는 너비로 설정
                height: 300,
                fit: BoxFit.cover,// 원하는 높이로 설정
              ), // 이미지를 네트워크에서 가져옴
              SizedBox(height: 20),
              Icon(
                emotionIcon,
                size: 60,
                color: emotionColor,
              ),
              // 결과 값 표시
              Text(
                '분석 결과: ${result.emotion}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              // 감정 확률 표시
              Text(
                '수치: ${result.probability}%',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                emotionText,
                style: TextStyle(fontSize: 14), // 텍스트 크기 조절
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SelectPage()),
                        (Route<dynamic> route) => false,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white),
                ),
                child: Text('홈으로 가기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}