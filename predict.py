from imageai.Classification.Custom import CustomImageClassification
import os

execution_path = os.getcwd()

prediction = CustomImageClassification()
prediction.setModelTypeAsDenseNet121()
prediction.setModelPath("data/models/model_ex-003_acc-0.999939.h5")
prediction.setJsonPath("data/json/model_class.json")
prediction.loadModel(num_objects=8)

predictions, probabilities = prediction.predictImage("admin_images/mp.png", result_count=8)

for eachPrediction, eachProbability in zip(predictions, probabilities):
    print(eachPrediction , " : " , eachProbability)

