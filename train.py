from imageai.Classification.Custom import ClassificationModelTrainer

model_trainer = ClassificationModelTrainer()
model_trainer.setModelTypeAsDenseNet121()
model_trainer.setDataDirectory("data")
model_trainer.trainModel(num_objects=8, num_experiments=300, enhance_data=True, batch_size=32, show_network_summary=True)

